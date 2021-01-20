Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B3E172FCAD1
	for <lists+dm-devel@lfdr.de>; Wed, 20 Jan 2021 06:48:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-OykYctTTMG2mA7UdMoC_Uw-1; Wed, 20 Jan 2021 00:48:17 -0500
X-MC-Unique: OykYctTTMG2mA7UdMoC_Uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40414806661;
	Wed, 20 Jan 2021 05:48:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF74C2BFE4;
	Wed, 20 Jan 2021 05:48:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23E52180954D;
	Wed, 20 Jan 2021 05:47:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10K5lfKt020660 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 00:47:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D082BA9FBD; Wed, 20 Jan 2021 05:47:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2A2AB599
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 05:47:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A0CC800889
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 05:47:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-497-FvFjmuzFOwSFfUZvViAzJA-1;
	Wed, 20 Jan 2021 00:47:34 -0500
X-MC-Unique: FvFjmuzFOwSFfUZvViAzJA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 501AA2313A;
	Wed, 20 Jan 2021 05:47:33 +0000 (UTC)
Date: Tue, 19 Jan 2021 21:47:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <YAfD81Jw/0NU0eWN@sol.localdomain>
References: <20210120012704.770095-1-sashal@kernel.org>
	<20210120012704.770095-3-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210120012704.770095-3-sashal@kernel.org>
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
Cc: Mike Snitzer <snitzer@redhat.com>, Anthony Iliopoulos <ailiop@suse.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH AUTOSEL 5.4 03/26] dm integrity: select
 CRYPTO_SKCIPHER
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 19, 2021 at 08:26:40PM -0500, Sasha Levin wrote:
> From: Anthony Iliopoulos <ailiop@suse.com>
> 
> [ Upstream commit f7b347acb5f6c29d9229bb64893d8b6a2c7949fb ]
> 
> The integrity target relies on skcipher for encryption/decryption, but
> certain kernel configurations may not enable CRYPTO_SKCIPHER, leading to
> compilation errors due to unresolved symbols. Explicitly select
> CRYPTO_SKCIPHER for DM_INTEGRITY, since it is unconditionally dependent
> on it.
> 
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/md/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index aa98953f4462e..7dd6e98257c72 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -565,6 +565,7 @@ config DM_INTEGRITY
>  	select BLK_DEV_INTEGRITY
>  	select DM_BUFIO
>  	select CRYPTO
> +	select CRYPTO_SKCIPHER
>  	select ASYNC_XOR
>  	---help---
>  	  This device-mapper target emulates a block device that has

CRYPTO_SKCIPHER doesn't exist in 5.4 and earlier because it was renamed from
CRYPTO_BLKCIPHER in 5.5.  If this patch is really important enough to backport,
CRYPTO_SKCIPHER will need to be changed to CRYPTO_BLKCIPHER.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

