import UIKit

protocol TransitioningAnimationProtocol: AnyObject {
    var transitionView: UIView { get }
    var transitionPoint: CGPoint { get }
    func layoutIfNeeded()
}

final class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let scale: CGFloat
    let duration: CGFloat

    init(scale: CGFloat = 2.0,
         duration: CGFloat = 0.4) {
        self.scale = scale
        self.duration = duration
    }
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let navigationController = transitionContext.viewController(forKey: .from) as? UINavigationController,
            let origin = navigationController.viewControllers.first as? TransitioningAnimationProtocol,
            let destinationView = transitionContext.view(forKey: .to),
            let destination = transitionContext.viewController(forKey: .to) as? TransitioningAnimationProtocol
        else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        destination.layoutIfNeeded()

        let destinationPoint = destination.transitionPoint
        let originPoint = origin.transitionPoint
        let originView = origin.transitionView
        
        let dx = originPoint.x - destinationPoint.x
        let dy = originPoint.y - destinationPoint.y
        
        let snapshotView = originView.snapshotView(afterScreenUpdates: false)!
        snapshotView.center = destinationPoint
        snapshotView.transform = CGAffineTransform(translationX: dx, y: dy)
        
        containerView.addSubview(destinationView)
        containerView.addSubview(snapshotView)
        destinationView.alpha = 0.0
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                snapshotView.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
                destinationView.alpha = 1.0
            }, completion: { _ in
                snapshotView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        )
    }
}
