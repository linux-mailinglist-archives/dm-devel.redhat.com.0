Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55BB240BAD2
	for <lists+dm-devel@lfdr.de>; Tue, 14 Sep 2021 23:57:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-i79jlDE6NQ-4QLyU7SD50Q-1; Tue, 14 Sep 2021 17:57:04 -0400
X-MC-Unique: i79jlDE6NQ-4QLyU7SD50Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEBCD5074B;
	Tue, 14 Sep 2021 21:56:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 951B55D9CA;
	Tue, 14 Sep 2021 21:56:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D10C44E58E;
	Tue, 14 Sep 2021 21:56:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ELr0ZN027962 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 17:53:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 345F41009B80; Tue, 14 Sep 2021 21:53:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ECCF1009153
	for <dm-devel@redhat.com>; Tue, 14 Sep 2021 21:52:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75AF6185A79C
	for <dm-devel@redhat.com>; Tue, 14 Sep 2021 21:52:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-159-H-dLElMeNfm8R3TSnjV8CA-1;
	Tue, 14 Sep 2021 17:52:54 -0400
X-MC-Unique: H-dLElMeNfm8R3TSnjV8CA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 415C660EE9;
	Tue, 14 Sep 2021 21:52:53 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:52:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org
Message-ID: <YUEZs5/9Ao2/KhDw@sol.localdomain>
References: <20210913013135.102404-1-ebiggers@kernel.org>
	<20210913013135.102404-5-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210913013135.102404-5-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, dm-devel@redhat.com,
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/5] blk-crypto: rename blk_keyslot_manager
 to blk_crypto_profile
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 12, 2021 at 06:31:34PM -0700, Eric Biggers wrote:
> diff --git a/block/blk-integrity.c b/block/blk-integrity.c
> index 69a12177dfb62..db656d12050f7 100644
> --- a/block/blk-integrity.c
> +++ b/block/blk-integrity.c
> @@ -411,7 +411,7 @@ void blk_integrity_register(struct gendisk *disk, struct blk_integrity *template
>  #ifdef CONFIG_BLK_INLINE_ENCRYPTION
>  	if (disk->queue->ksm) {
>  		pr_warn("blk-integrity: Integrity and hardware inline encryption are not supported together. Disabling hardware inline encryption.\n");
> -		blk_ksm_unregister(disk->queue);
> +		blk_crypto_unregister(disk->queue);
>  	}
>  #endif
>  }

Note, there is a build error here when CONFIG_BLK_DEV_INTEGRITY=y, so I'll have
to send a new version even if there are no other comments.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

