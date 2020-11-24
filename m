Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1722C1BC0
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 03:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606186264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sq+Br3u+MqujgjQ97KD6P3r80CZawDELoIJVi9f1qdQ=;
	b=YgBaI3cXG4aM1z5axvtPsfkX/emjc5pVDmIbQNznJg+Jt9+Gs7NAe+EVRKgtt1Zt53AyMe
	7bhuhbMXvsnvOcCp05RL3Ucqq10OkX0Mc/+lH5ME+YnfHdGG+mIJ+HNMbvy/jbEFGb/jFp
	LcphYyG0s2R2KGv6UAKtEpgeu/hox1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-hqdTGZFuNkqhkZ3h48LeZQ-1; Mon, 23 Nov 2020 21:51:00 -0500
X-MC-Unique: hqdTGZFuNkqhkZ3h48LeZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 992E218B9F00;
	Tue, 24 Nov 2020 02:50:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E9B60C04;
	Tue, 24 Nov 2020 02:50:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88B57180954D;
	Tue, 24 Nov 2020 02:50:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AO2oKNY002824 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 21:50:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E55985D9CC; Tue, 24 Nov 2020 02:50:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E574C5D9CA;
	Tue, 24 Nov 2020 02:50:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0AO2oGMf024965; 
	Mon, 23 Nov 2020 20:50:16 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0AO2oFxi024964;
	Mon, 23 Nov 2020 20:50:15 -0600
Date: Mon, 23 Nov 2020 20:50:15 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Message-ID: <20201124025015.GC3103@octiron.msp.redhat.com>
References: <1604963562-31905-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1604963562-31905-1-git-send-email-bmarzins@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH] mpathpersist: Fix Register and Ignore with
 0x00 SARK
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 09, 2020 at 05:12:42PM -0600, Benjamin Marzinski wrote:
> When the Register and Ignore command is run with sg_persist, if a 0x00
> Service Action Reservation Key is given or the --param-sark option is
> not used at all, sg_persist will clear the registration.  mpathpersist
> will fail with an error.  This patch fixes mpathpersist to work like
> sg_persist in this case.
>

NACK. This only fixes the case where "reservation_key" is set to "file".
It also needlessly clears the key in the prkeys file twice. I'll send
a fixed version.

-Ben
 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmpathpersist/mpath_persist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> index 79322e86..703f8e13 100644
> --- a/libmpathpersist/mpath_persist.c
> +++ b/libmpathpersist/mpath_persist.c
> @@ -289,8 +289,8 @@ int __mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
>  	put_multipath_config(conf);
>  
>  	memcpy(&prkey, paramp->sa_key, 8);
> -	if (mpp->prkey_source == PRKEY_SOURCE_FILE && prkey &&
> -	    ((!get_be64(mpp->reservation_key) &&
> +	if (mpp->prkey_source == PRKEY_SOURCE_FILE &&
> +	    ((!get_be64(mpp->reservation_key) && prkey &&
>  	      rq_servact == MPATH_PROUT_REG_SA) ||
>  	     rq_servact == MPATH_PROUT_REG_IGN_SA)) {
>  		memcpy(&mpp->reservation_key, paramp->sa_key, 8);
> -- 
> 2.17.2
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

