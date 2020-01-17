Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B16F3140E8C
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 17:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579277049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=43/VnKlctAIKlxz2AQyRMNDq/h5MPrScolHVkA/QKEo=;
	b=eajXjgtGrLnRLdsBa56gxT8WG0ENssqCHMlwxIYWWyn0d4en6L+/zGleXJ2AnLxApj5qcn
	5pGjYYUAH9tG0M3sLn91SdSWkOQI5Skc2fR5LC/Zf+TbgFqKiiQ3K+acKHmSwuDf7GRSCO
	I3LyDqQ2vme8I+s2LKOiHeyRgGZDPO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-PjemVN3uOmGxfLK9kowlDQ-1; Fri, 17 Jan 2020 11:04:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F7711902EC1;
	Fri, 17 Jan 2020 16:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6C984BAB;
	Fri, 17 Jan 2020 16:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBE2A87091;
	Fri, 17 Jan 2020 16:03:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HG3e6t018706 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 11:03:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76A3B202A940; Fri, 17 Jan 2020 16:03:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E5A20292BF
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:03:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762BD18AE96F
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 16:03:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-197-N5gtVe79OCm9Bkr_OdF03g-1;
	Fri, 17 Jan 2020 11:03:32 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3FA41ADE3;
	Fri, 17 Jan 2020 16:03:31 +0000 (UTC)
Message-ID: <ed37ab905f7790af8846a47052dfde6f2a70dd04.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 17:04:47 +0100
In-Reply-To: <1579227500-17196-7-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-7-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: N5gtVe79OCm9Bkr_OdF03g-1
X-MC-Unique: PjemVN3uOmGxfLK9kowlDQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HG3e6t018706
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/15] libmultipath: add missing hwe mpe
	variable merges
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> There were some variables in the hwe and mpe structs that weren't
> being
> merged by merge_hwe() and merge_mpe().
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 20e3b8bf..85626e96 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -372,6 +372,10 @@ merge_hwe (struct hwentry * dst, struct hwentry
> * src)
>  	merge_num(san_path_err_threshold);
>  	merge_num(san_path_err_forget_rate);
>  	merge_num(san_path_err_recovery_time);
> +	merge_num(marginal_path_err_sample_time);
> +	merge_num(marginal_path_err_rate_threshold);
> +	merge_num(marginal_path_err_recheck_gap_time);
> +	merge_num(marginal_path_double_failed_time);

Hm, looking at this, I think we should not attempt to merge sets of
parameters that belong together like this. The marginal_path params
should only be merged if they are *all* unset in the destination.
Otherwise we risk to end up with an inconsistent parameter set from two
different sources.

But that's not a failure of your patch, it should be done in a follow-
up fix. So:

Reviewed-by: Martin Wilck <mwilck@suse.com>




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

