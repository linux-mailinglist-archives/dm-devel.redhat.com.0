Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9F630DF4B
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 17:11:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-nnoxqOIdN8CNWAVYM5-ZMA-1; Wed, 03 Feb 2021 11:11:32 -0500
X-MC-Unique: nnoxqOIdN8CNWAVYM5-ZMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90E3107ACF2;
	Wed,  3 Feb 2021 16:11:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0431E6;
	Wed,  3 Feb 2021 16:11:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B761318095C9;
	Wed,  3 Feb 2021 16:11:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113GBLUp011701 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 11:11:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2BEADEE7F; Wed,  3 Feb 2021 16:11:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CB6F9E62
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 16:11:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32556811E88
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 16:11:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-244-GHyT84ByM9SEuamwPJKZ0A-1;
	Wed, 03 Feb 2021 11:11:17 -0500
X-MC-Unique: GHyT84ByM9SEuamwPJKZ0A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A85D64DDB;
	Wed,  3 Feb 2021 16:01:00 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:00:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <YBrIuipGnzmsyKxg@kroah.com>
References: <1612367638-3794-1-git-send-email-sergei.shtepa@veeam.com>
	<1612367638-3794-5-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
In-Reply-To: <1612367638-3794-5-git-send-email-sergei.shtepa@veeam.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Damien.LeMoal@wdc.com, jack@suse.cz, snitzer@redhat.com,
	corbet@lwn.net, johannes.thumshirn@wdc.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.lei@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, steve@sk2.org, koct9i@gmail.com,
	agk@redhat.com, pavgel.tide@veeam.com
Subject: Re: [dm-devel] [PATCH v4 4/6] dm: new ioctl DM_DEV_REMAP_CMD
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 03, 2021 at 06:53:56PM +0300, Sergei Shtepa wrote:
> --- a/include/uapi/linux/dm-ioctl.h
> +++ b/include/uapi/linux/dm-ioctl.h
> @@ -214,6 +214,15 @@ struct dm_target_msg {
>  	char message[0];
>  };
>  
> +enum {
> +	REMAP_START_CMD = 1,
> +	REMAP_FINISH_CMD,

Don't you need to say what REMAP_FINISH_CMD is explicitly?

> +};
> +
> +struct dm_remap_param {
> +	uint8_t cmd;
> +	uint8_t params[0];

These need to be __u8, "uint8_t" is not a valid type that crosses the
user/kernel boundry.

thanks,

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

