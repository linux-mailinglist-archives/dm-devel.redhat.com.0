Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613757C4CC
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jul 2022 08:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658386680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9TytQJ3PDB+kuwZJyVPYqVTcU8Wf2S5RmdQ4V8p60s0=;
	b=GsIkRevNWNFO7DdgVSEJXvtN2E95+J6MMiBsu55mC1iVExfleZ8Y10h6I6o8kbc7I9S2ZJ
	JEZBLmcXOEMrM3UOvyubwNMcHfkf33ykgzBcAXT2RrOlKMhJbqSFDR6osOTKGm1ThhPS+N
	mioer0sUYZ9FVZ/1AgM/8TJ+Ufl5/BI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-sSJP0PymNjK8AdiUtMmMWA-1; Thu, 21 Jul 2022 02:57:56 -0400
X-MC-Unique: sSJP0PymNjK8AdiUtMmMWA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1E4D3810D3B;
	Thu, 21 Jul 2022 06:57:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7F9D492CA6;
	Thu, 21 Jul 2022 06:57:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2EC0B1947053;
	Thu, 21 Jul 2022 06:57:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66C2F1947043
 for <dm-devel@listman.corp.redhat.com>; Thu, 21 Jul 2022 06:57:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43531C2812B; Thu, 21 Jul 2022 06:57:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F334C28129
 for <dm-devel@redhat.com>; Thu, 21 Jul 2022 06:57:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D938039A0
 for <dm-devel@redhat.com>; Thu, 21 Jul 2022 06:57:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-2X_yRWLFMJSVGPYSmVU9QQ-1; Thu, 21 Jul 2022 02:57:43 -0400
X-MC-Unique: 2X_yRWLFMJSVGPYSmVU9QQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52E8EB821EB;
 Thu, 21 Jul 2022 06:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8797C341C0;
 Thu, 21 Jul 2022 06:49:08 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:49:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Israel Rukshin <israelr@nvidia.com>
Message-ID: <Ytj249InQTKdFshA@sol.localdomain>
References: <1658316391-13472-1-git-send-email-israelr@nvidia.com>
 <1658316391-13472-2-git-send-email-israelr@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1658316391-13472-2-git-send-email-israelr@nvidia.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH 1/1] block: Add support for setting inline
 encryption key per block device
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
Cc: Jens Axboe <axboe@kernel.dk>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 linux-fscrypt@vger.kernel.org, Linux-block <linux-block@vger.kernel.org>,
 dm-devel@redhat.com, Nitzan Carmi <nitzanc@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Israel,

On Wed, Jul 20, 2022 at 02:26:31PM +0300, Israel Rukshin wrote:
> Until now, using inline encryption key has been possible only at
> filesystem level via fs-crypt. The patch allows to set a default
> inline encryption key per block device. Once the key is set, all the
> read commands will be decrypted, and all the write commands will
> be encrypted. The key can be overridden by another key from a higher
> level (FS/DM).
> 
> To add/remove a key, the patch introduces a block device ioctl:
>  - BLKCRYPTOSETKEY: set a key with the following attributes:
>     - crypto_mode: identifier for the encryption algorithm to use
>     - raw_key_ptr:  pointer to a buffer of the raw key
>     - raw_key_size: size in bytes of the raw key
>     - data_unit_size: the data unit size to use for en/decryption
>       (must be <= device logical block size)
> To remove the key, use the same ioctl with raw_key_size = 0.
> It is not possible to remove the key when it is in use by any
> in-flight IO or when the block device is open.
> 
> Signed-off-by: Israel Rukshin <israelr@nvidia.com>

Thanks for sending this out.  I've added dm-devel@redhat.com to Cc, as I think
the device-mapper developers need to be aware of this.  I also added
linux-fscrypt@vger.kernel.org, as this is relevant there too.

I'm glad to see a proposal in this area -- this is something that is greatly
needed.  Chrome OS is looking for something like "dm-crypt with inline crypto
support", which this should work for.  Android is also looking for something
similar with the additional property that filesystems can override the key used.

Some high-level comments about this approach (I'll send some more routine code
review nits in a separate email):

> @@ -134,7 +150,8 @@ static inline void bio_crypt_do_front_merge(struct request *rq,
>  bool __blk_crypto_bio_prep(struct bio **bio_ptr);
>  static inline bool blk_crypto_bio_prep(struct bio **bio_ptr)
>  {
> -	if (bio_has_crypt_ctx(*bio_ptr))
> +	if (bio_has_crypt_ctx(*bio_ptr) ||
> +	    blk_crypto_bio_set_default_ctx(*bio_ptr))
>  		return __blk_crypto_bio_prep(bio_ptr);
>  	return true;

This allows upper layers to override the block device key, which as I've
mentioned is very useful -- it allows block device encryption and file
encryption to be used together without the performance cost of double
encryption.  Android already needs and uses this type of encryption.

Still, it's important to understand the limitations of this particular way to
achieve this type of encryption, since I want to make sure everyone is on board.


First, this implementation currently doesn't provide a way to skip the default
key without setting an encryption context.  There are actually two cases where
the default key must be skipped when there is no encryption context.  The first
is when the filesystem is doing I/O to an encrypted file, but the filesystem
wasn't mounted with the "inlinecrypt" mount option.  This could be worked around
by requiring "inlinecrypt" if a default key is set; that loses some flexibility,
but it could be done.  The second case, which can't be worked around at the
filesystem level, is that the f2fs garbage collector sometimes has to move the
data of encrypted files on-disk without having access to their encryption key.

So we'll actually need a separate indicator for "skip the default key".  The
simplest solution would be a new flag in the bio.  However, to avoid using space
in struct bio, it could instead be a special value of the encryption context.


Second, both this solution and dm-based solutions have the property that they
allow the default key to be *arbitrarily* overridden by upper layers.  That
means that there is no *general* guarantee that all data on the device is
protected at least as well as the default key.  Consider e.g. the default key
being overridden by an all-zeros key.  Concerns about this sort of architecture
were raised on a dm-crypt patchset several years ago; see
https://lore.kernel.org/r/0b268ff7-5fc8-c85f-a530-82e9844f0400@gmail.com and
https://lore.kernel.org/r/20170616125511.GA11824@yeono.kjorling.se.

The alternative architecture for this that I've had in mind, and which has been
prototyped for f2fs
(https://lore.kernel.org/linux-f2fs-devel/20201005073606.1949772-1-satyat@google.com/T/#u),
is for the filesystem to manage *all* the encryption, and to mix the default key
into all file keys.  Then, all data on the block device would always be
protected by the default key or better, regardless of userspace.

On the other hand, I'd personally be fine with saying that this isn't actually
needed, i.e. that allowing arbitrary overriding of the default key is fine,
since userspace should just set up the keys properly.  For example, Android
doesn't need this at all, as it sets up all its keys properly.  But I want to
make sure that everyone is generally okay with this now, as I personally don't
see a fundamental difference between this and what the dm-crypt developers had
rejected *very* forcefully before.  Perhaps it's acceptable now simply because
it wouldn't be part of dm-crypt; it's a new thing, so it can have new semantics.

> +static int blk_crypto_ioctl_create_key(struct request_queue *q,
> +				       void __user *argp)
> +{
> +	struct blk_crypto_set_key_arg arg;
> +	u8 raw_key[BLK_CRYPTO_MAX_KEY_SIZE];
> +	struct blk_crypto_key *blk_key;
> +	int ret;
> +
> +	if (copy_from_user(&arg, argp, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (memchr_inv(arg.reserved, 0, sizeof(arg.reserved)))
> +		return -EINVAL;
> +
> +	if (!arg.raw_key_size)
> +		return blk_crypto_destroy_default_key(q);
> +
> +	if (q->blk_key) {
> +		pr_err("Crypto key is already configured\n");
> +		return -EBUSY;
> +	}
> +
> +	if (arg.raw_key_size > sizeof(raw_key))
> +		return -EINVAL;
> +
> +	if (arg.data_unit_size > queue_logical_block_size(q)) {
> +		pr_err("Data unit size is bigger than logical block size\n");
> +		return -EINVAL;
> +	}

This is forbidding data_unit_size greater than logical_block_size.  I see why
you did this: the block layer doesn't know what is above it, and it could
receive I/O requests targeting individual logical blocks.  However, this can
result in a big efficiency loss; a common example is when a filesystem with a
4096-byte block size is used on a block device with a logical block size of 512
bytes.  Since such a filesystem only submits I/O in 4096-byte blocks, it's safe
for the data_unit_size to be 4096 bytes as well.  This is much more efficient
than 512 bytes, since there is overhead for every data unit.  Note that some of
this overhead is intrinsic in the crypto algorithms themselves and cannot be
optimized out by better hardware.

The device-mapper based solution wouldn't have this problem, as the
device-mapper target (dm-inlinecrypt or whatever) would just advertise the
crypto data unit size as the logical block size, like dm-crypt does.

I'm wondering if anyone any thoughts about how to allow data_unit_size >
logical_block_size with this patch's approach.  I suppose that the ioctl could
just allow setting it, and the block layer could fail any I/O that isn't
properly aligned to the data_unit_size.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

