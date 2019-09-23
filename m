Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F8BB336
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 13:55:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AEA4308FC20;
	Mon, 23 Sep 2019 11:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 179BA60BF7;
	Mon, 23 Sep 2019 11:55:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EACD9180085A;
	Mon, 23 Sep 2019 11:55:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NBhlDn029523 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 07:43:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7EFF5D71C; Mon, 23 Sep 2019 11:43:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A3415D713;
	Mon, 23 Sep 2019 11:43:45 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
	(mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9778309BDF2;
	Mon, 23 Sep 2019 11:43:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,539,1559512800"; d="scan'208";a="402978736"
Received: from unknown (HELO hadrien) ([65.39.69.237])
	by mail2-relais-roc.national.inria.fr with
	ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 13:43:42 +0200
Date: Mon, 23 Sep 2019 13:43:41 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Valentin Schneider <valentin.schneider@arm.com>
In-Reply-To: <d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
Message-ID: <alpine.DEB.2.21.1909231340090.2227@hadrien>
References: <a43fe392-bd6a-71f5-8611-c6b764ba56c3@arm.com>
	<7e3e784c-e8e6-f9ba-490f-ec3bf956d96b@web.de>
	<0c4dcb91-4830-0013-b8c6-64b9e1ce47d4@arm.com>
	<32d65b15-1855-e7eb-e9c4-81560fab62ea@arm.com>
	<alpine.DEB.2.21.1909231228200.2272@hadrien>
	<d529c390-546e-a8a4-f475-c3ee41f97645@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Mon, 23 Sep 2019 11:43:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 23 Sep 2019 11:43:44 +0000 (UTC) for IP:'192.134.164.83'
	DOMAIN:'mail2-relais-roc.national.inria.fr'
	HELO:'mail2-relais-roc.national.inria.fr'
	FROM:'julia.lawall@lip6.fr' RCPT:''
X-RedHat-Spam-Score: -4.347  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NEUTRAL) 192.134.164.83
	mail2-relais-roc.national.inria.fr 192.134.164.83
	mail2-relais-roc.national.inria.fr <julia.lawall@lip6.fr>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 07:51:30 -0400
Cc: Andrea Arcangeli <aarcange@redhat.com>, rcu@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Markus Elfring <Markus.Elfring@web.de>, Jens Axboe <axboe@kernel.dk>,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [dm-devel] sched: make struct task_struct::state 32-bit
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 23 Sep 2019 11:55:53 +0000 (UTC)

> >> // FIXME: match functions that do something with state_var underneath?
> >> // How to do recursive rules?
> >
> > You want to look at the definitions of called functions?  Coccinelle
> > doesn't really support that, but there are hackish ways to add that.  How
> > many function calls would you expect have to be unrolled?
> >
>
> I wouldn't expect more than a handful (~5). I suppose this has to do with
> injecting some Python/Ocaml code? I have some examples bookmarked but
> haven't gotten to stare at them long enough.

You can look at iteration.cocci, but it's a bit complex.

You could match definitions of functions that do what you are interested
in, then store the names of these functions in a list (python/ocaml), and
then look for calls to those functions.  Something like

identifier fn : script:ocaml() { in_my_list fn };

> >> // Fixup local variables
> >> @depends on patch && state_access@
> >> identifier state_var = state_access.state_var;
> >> @@
> >> (
> >> - long
> >> + int
> >> |
> >> - unsigned long
> >> + unsigned int
> >> )
> >> state_var;
> >>
> >> // Fixup function parameters
> >> @depends on patch && state_access@
> >> identifier fn;
> >> identifier state_var = state_access.state_var;
> >> @@
> >>
> >> fn(...,
> >> - long state_var
> >> + int state_var
> >> ,...)
> >> {
> >> 	...
> >> }
> >>
> >> // FIXME: find a way to squash that with the above?
> >
> > I think that you can make a disjunction on a function parameter
> >
> > fn(...,
> > (
> > - T1 x1
> > + T2 x2
> > |
> > - T3 x3
> > + T4 x4
> > )
> > , ...) { ... }
> >
>
> My attempt at this gives me "minus: parse error", which is why I went
> with the split.

OK, the split is probably not a major catastrophe...

julia

>
> Something simple like this works:
> ---
> virtual patch
> virtual report
>
> @@
> identifier fn;
> identifier p;
> @@
>
> fn(...,
> - long
> + int
> p
> ,...)
> {
> 	...
> }
> ---
>
> but this doesn't:
> ---
> virtual patch
> virtual report
>
> @@
> identifier fn;
> identifier p;
> @@
>
> fn(...,
> (
> - long p
> + int p
> |
> - unsigned long p
> + unsigned int p
> )
> ,...)
> {
> 	...
> }
> ---
>
> > julia
> >
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
