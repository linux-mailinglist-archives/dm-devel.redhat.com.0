Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C25BD217C08
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 02:01:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-D_7PJf9zOx6v3KB5aE6eow-1; Tue, 07 Jul 2020 20:01:49 -0400
X-MC-Unique: D_7PJf9zOx6v3KB5aE6eow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD78E10059A8;
	Wed,  8 Jul 2020 00:01:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8FA6797E0;
	Wed,  8 Jul 2020 00:01:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C6981809547;
	Wed,  8 Jul 2020 00:01:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067Ntu5E028229 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 19:55:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD9CA2166B27; Tue,  7 Jul 2020 23:55:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9C212166BA4
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 23:55:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96F948EF3A4
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 23:55:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-366-dpku0MNEOceXhYa8IRFhew-1;
	Tue, 07 Jul 2020 19:55:49 -0400
X-MC-Unique: dpku0MNEOceXhYa8IRFhew-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91F76AAC3;
	Tue,  7 Jul 2020 23:55:48 +0000 (UTC)
Message-ID: <cdc3fc77b7cc5cd0b38083f02acc6aa9b116e5f1.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, Xose Vazquez Perez
	<xose.vazquez@gmail.com>
Date: Wed, 08 Jul 2020 01:55:46 +0200
In-Reply-To: <877dvfm25a.fsf@collabora.com>
References: <20200707211758.12528-1-xose.vazquez@gmail.com>
	<877dvfm25a.fsf@collabora.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Khazhismel Kumykov <khazhy@google.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: add info to man page for
 the historical-service-time path selector
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-07 at 17:44 -0400, Gabriel Krisman Bertazi wrote:
> Xose Vazquez Perez <xose.vazquez@gmail.com> writes:
> 
> > Cc: Khazhismel Kumykov <khazhy@google.com>
> > Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
> > Cc: Martin Wilck <mwilck@suse.com>
> > Cc: Benjamin Marzinski <bmarzins@redhat.com>
> > Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> > Cc: DM-DEVEL ML <dm-devel@redhat.com>
> > Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> > ---
> >  multipath/multipath.conf.5 | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/multipath/multipath.conf.5
> > b/multipath/multipath.conf.5
> > index 05a5e8ff..6e637769 100644
> > --- a/multipath/multipath.conf.5
> > +++ b/multipath/multipath.conf.5
> > @@ -205,6 +205,10 @@ of outstanding I/O to the path.
> >  (Since 2.6.31 kernel) Choose the path for the next bunch of I/O
> > based on the amount
> >  of outstanding I/O to the path and its relative throughput.
> >  .TP
> > +.I "historical-service-time 0"
> > +(Since 5.8 kernel) Choose the path for the next bunch of I/O based
> > on the shortest
> > +time by comparing estimated service time (based on historical
> > service
> > time).
> Hi,
> 
> Thanks for doing this.
> 
> What about:
> 
> Choose the path for the next bunch of IOs through an estimation of
> future service time based on the history of previous I/O submitted to
> each path, in an attempt to maximize throughput.  A path's service-
> time
> is loosely defined as the time between an IO start and its completion
> and is updated through an exponential moving average (EMA) of the
> historical service time of each path.

This is a too lengthy compared to the text we provide for the other
policies. I would suggest using just the first sentence:

> (Since 5.8 kernel) Choose the path for the next bunch of IOs through
an estimation of
> future service time based on the history of previous I/O submitted to
> each path.

If you want to provide more detail, add a link to the documentation of
the kernel feature, or provide a separate man page. multipath.conf(5)
is too big already.

> It supports some parameters, shouldn't they be documented here? 

Yes, definitely. Please add the parameter definitions. 

>  Some
> explanation for the parameters exists in hst_create() in the kernel
> 
>  /*
>   * Arguments: [<base_weight> [<threshold_multiplier>]]
>   *   <base_weight>: Base weight for ema [0, 1024) 10-bit fixed
> point. A
>   *                  value of 0 will completely ignore any history.
>   *                  If not given, default (HST_FIXED_95) is used.
>   *   <threshold_multiplier>: Minimum threshold multiplier for paths
> to
>   *                  be considered different. That is, a path is
>   *                  considered different iff (p1 > N * p2) where p1
>   *                  is the path with higher service time. A
> threshold
>   *                  of 1 or 0 has no effect. Defaults to 0.
>   */

This is way too technical, hard to understand even for developers. What
is HST_FIXED_95? What is the time unit for EMA (IOW, can we relate the
base weight to a half-life time somehow)? Why would I want to use N !=
0, what effect does it have in practice? I guess we should simply
provide the parameter names and recommended values to give users a head
start, and provide a link to a description of the algorithm for users
who want to know the details.

Please send an updated patch.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

