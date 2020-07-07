Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id ED5E8217ACA
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 23:56:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-jhvaN9TzOk2YHorqJztFmQ-1; Tue, 07 Jul 2020 17:56:39 -0400
X-MC-Unique: jhvaN9TzOk2YHorqJztFmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ACEC461;
	Tue,  7 Jul 2020 21:56:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33FC071674;
	Tue,  7 Jul 2020 21:56:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CB8872F4D;
	Tue,  7 Jul 2020 21:56:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067Ls1O2015672 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 17:54:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49C7D114FEE0; Tue,  7 Jul 2020 21:54:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45BD8114FEE1
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 21:53:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48DE5804AC8
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 21:53:59 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-f5reY_KvNjGkPesCC7ahUQ-1; Tue, 07 Jul 2020 17:53:54 -0400
X-MC-Unique: f5reY_KvNjGkPesCC7ahUQ-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 4A6B22A2093
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Organization: Collabora
References: <20200707211758.12528-1-xose.vazquez@gmail.com>
Date: Tue, 07 Jul 2020 17:44:01 -0400
In-Reply-To: <20200707211758.12528-1-xose.vazquez@gmail.com> (Xose Vazquez
	Perez's message of "Tue, 7 Jul 2020 23:17:58 +0200")
Message-ID: <877dvfm25a.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>,
	Khazhismel Kumykov <khazhy@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xose Vazquez Perez <xose.vazquez@gmail.com> writes:

> Cc: Khazhismel Kumykov <khazhy@google.com>
> Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  multipath/multipath.conf.5 | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index 05a5e8ff..6e637769 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -205,6 +205,10 @@ of outstanding I/O to the path.
>  (Since 2.6.31 kernel) Choose the path for the next bunch of I/O based on the amount
>  of outstanding I/O to the path and its relative throughput.
>  .TP
> +.I "historical-service-time 0"
> +(Since 5.8 kernel) Choose the path for the next bunch of I/O based on the shortest
> +time by comparing estimated service time (based on historical service
> time).
Hi,

Thanks for doing this.

What about:

Choose the path for the next bunch of IOs through an estimation of
future service time based on the history of previous I/O submitted to
each path, in an attempt to maximize throughput.  A path's service-time
is loosely defined as the time between an IO start and its completion
and is updated through an exponential moving average (EMA) of the
historical service time of each path.

> +.TP
>  The default is: \fBservice-time 0\fR

It supports some parameters, shouldn't they be documented here?  Some
explanation for the parameters exists in hst_create() in the kernel

 /*
  * Arguments: [<base_weight> [<threshold_multiplier>]]
  *   <base_weight>: Base weight for ema [0, 1024) 10-bit fixed point. A
  *                  value of 0 will completely ignore any history.
  *                  If not given, default (HST_FIXED_95) is used.
  *   <threshold_multiplier>: Minimum threshold multiplier for paths to
  *                  be considered different. That is, a path is
  *                  considered different iff (p1 > N * p2) where p1
  *                  is the path with higher service time. A threshold
  *                  of 1 or 0 has no effect. Defaults to 0.
  */


>  .RE
>  .

-- 
Gabriel Krisman Bertazi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

