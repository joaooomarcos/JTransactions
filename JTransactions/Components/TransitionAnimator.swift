import UIKit

protocol TransitioningAnimationProtocol: AnyObject {
    var transitionView: UIView { get }
    var transitionPoint: CGPoint { get }
    func layoutIfNeeded()
}

final class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum Kind {
        case present
        case dismiss
    }
    
    let scale: CGFloat
    let duration: CGFloat
    let kind: Kind

    init(scale: CGFloat = 2.0,
         duration: CGFloat = 0.4,
         kind: Kind) {
        self.scale = scale
        self.duration = duration
        self.kind = kind
    }
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromNavigationController = transitionContext.viewController(forKey: .from) as? UINavigationController
        let fromViewController = fromNavigationController?.viewControllers.first ?? transitionContext.viewController(forKey: .from)
        
        let toNavigationController = transitionContext.viewController(forKey: .to) as? UINavigationController
        let toViewController = toNavigationController?.viewControllers.first ?? transitionContext.viewController(forKey: .to)
        
        guard
            let origin = fromViewController as? TransitioningAnimationProtocol,
            let destination = toViewController as? TransitioningAnimationProtocol,
            let toView = toViewController?.view,
            let fromView = fromViewController?.view
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let containerView = transitionContext.containerView
        
        if kind == .present {
            destination.layoutIfNeeded()
        }
        
        let destinationPoint = destination.transitionPoint
        let destinationView = destination.transitionView
        let originPoint = origin.transitionPoint
        let originView = origin.transitionView
        
        let dx = originPoint.x - destinationPoint.x
        let dy = originPoint.y - destinationPoint.y
        
        let viewForSnapshot: UIView = kind == .present ? originView : destinationView
        
        let snapshotView = viewForSnapshot.snapshotView(afterScreenUpdates: false)!
        snapshotView.center = destinationPoint
        
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: dx, y: dy)
        
        switch kind {
        case .present:
            toView.alpha = 0.0
            containerView.addSubview(toView)
        case .dismiss:
            transform = transform.scaledBy(x: scale, y: scale)
        }
        
        snapshotView.transform = transform
        containerView.addSubview(snapshotView)
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: .curveEaseInOut,
            animations: {
                switch self.kind {
                case .present:
                    snapshotView.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
                    toView.alpha = 1.0
                case .dismiss:
                    snapshotView.transform = .identity
                    fromView.alpha = 0.0
                }
            }, completion: { _ in
                snapshotView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        )
    }
}
