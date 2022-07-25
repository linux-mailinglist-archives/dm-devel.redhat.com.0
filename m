Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39974580090
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jul 2022 16:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658758579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pMgewsNv1oYISiTo3Y3BmGFhDUlnsKfBWWZ2glr4LUA=;
	b=c11Zk8FAarz/MvzulmiAdFAkIDggPwuOUjKn6nmKWyq8xS1LXa7Of4SBnYFl4/vU5OZw2Y
	tsZgN1etQ1vqYt449x7PLBkP7nFlEDZxswVdCrHbNl+1wE3kzWiMDn7y6uDZggBAv4pChG
	tPvvjWOizmCa4SXz9Xw/FFSmtATCIO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-iaCp6k7IPyi8BXw5_b-amg-1; Mon, 25 Jul 2022 10:16:18 -0400
X-MC-Unique: iaCp6k7IPyi8BXw5_b-amg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 142901C06905;
	Mon, 25 Jul 2022 14:16:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8004F2026D64;
	Mon, 25 Jul 2022 14:16:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B7FA1945D8C;
	Mon, 25 Jul 2022 14:16:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4E7D1945D81
 for <dm-devel@listman.corp.redhat.com>; Mon, 25 Jul 2022 14:16:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9579A400EA85; Mon, 25 Jul 2022 14:16:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 815C5400E577;
 Mon, 25 Jul 2022 14:16:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26PEG6h6015675;
 Mon, 25 Jul 2022 09:16:06 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26PEG5RM015674;
 Mon, 25 Jul 2022 09:16:05 -0500
Date: Mon, 25 Jul 2022 09:16:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20220725141605.GB10602@octiron.msp.redhat.com>
References: <20220721172204.14402-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220721172204.14402-1-xose.vazquez@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] multipath-tools: remove list of rebranded
 arrays vendors from man page
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 21, 2022 at 07:22:04PM +0200, Xose Vazquez Perez wrote:
> It does not provide useful info, and it is incomplete.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Cc: Martin Wilck <mwilck@suse.com>
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
> Cc: DM-DEVEL ML <dm-devel@redhat.com>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  multipath/multipath.conf.5 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index c2d34f18..d5506d99 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -315,12 +315,12 @@ accepts the optional prio_arg \fIexclusive_pref_bit\fR.
>  .TP
>  .I ontap
>  (Hardware-dependent)
> -Generate the path priority for NetApp ONTAP class and OEM arrays as IBM NSeries.
> +Generate the path priority for NetApp ONTAP class, and rebranded arrays.
>  .TP
>  .I rdac
>  (Hardware-dependent)
>  Generate the path priority for LSI/Engenio/NetApp RDAC class as NetApp SANtricity
> -E/EF Series, and OEM arrays from IBM DELL SGI STK and SUN.
> +E/EF Series, and rebranded arrays.
>  .TP
>  .I hp_sw
>  (Hardware-dependent)
> @@ -496,7 +496,7 @@ Active/Standby mode exclusively.
>  .I rdac
>  (Hardware-dependent)
>  Check the path state for LSI/Engenio/NetApp RDAC class as NetApp SANtricity E/EF
> -Series, and OEM arrays from IBM DELL SGI STK and SUN.
> +Series, and rebranded arrays.
>  .TP
>  .I directio
>  Read the first sector with direct I/O. This checker could cause spurious path
> @@ -1568,7 +1568,7 @@ families.
>  .I 1 rdac
>  (Hardware-dependent)
>  Hardware handler for LSI/Engenio/NetApp RDAC class as NetApp SANtricity E/EF
> -Series, and OEM arrays from IBM DELL SGI STK and SUN.
> +Series, and rebranded arrays.
>  .TP
>  .I 1 hp_sw
>  (Hardware-dependent)
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

