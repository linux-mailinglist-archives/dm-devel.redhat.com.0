Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 538B51306F5
	for <lists+dm-devel@lfdr.de>; Sun,  5 Jan 2020 10:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578217288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FOpu3upxqzvSX1kyjySkWgcsjN4MYw4gAAEbjBsiBN4=;
	b=ZuIWq6pjRs4Bh80QS6Fj39Xkdb1kzORbtCjsfYJRpcDNLZ/RVfMbSK/eI24V8vK9jRRNLJ
	hiXzV6wGY6/FwVZC9U/BVF/0I8HIpKGJ7ji6qioCyYURdwFwhrSin9KtEtEv8jGvRHnsq+
	+uazfQO6EvLeEwykp8Dj8bSBZElBMWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-4Ki3vXn1PNqxRn9q-PzNsA-1; Sun, 05 Jan 2020 04:41:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC84107ACC4;
	Sun,  5 Jan 2020 09:41:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62DFF108131B;
	Sun,  5 Jan 2020 09:41:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6305820EA;
	Sun,  5 Jan 2020 09:41:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0059fAfA029795 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jan 2020 04:41:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13A6D84FD7; Sun,  5 Jan 2020 09:41:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0E27BE7E;
	Sun,  5 Jan 2020 09:41:07 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0059f673007858; Sun, 5 Jan 2020 04:41:06 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0059f6C6007854; Sun, 5 Jan 2020 04:41:06 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 5 Jan 2020 04:41:06 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20200103082022.1283126-1-gmazyland@gmail.com>
Message-ID: <alpine.LRH.2.02.2001050440410.7781@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200103082022.1283126-1-gmazyland@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-crypt: Implement Elephant diffuser for
 Bitlocker compatibility
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 4Ki3vXn1PNqxRn9q-PzNsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 3 Jan 2020, Milan Broz wrote:

> This patch adds experimental support for BitLocker encryption
> with CBC mode and additional Elephant diffuser.
> 
> The mode was used in older Windows systems and it is provided
> mainly for compatibility reasons. The userspace support
> to activate these devices is being added to cryptsetup utility.
> 
> Read-write activation of such a device is very simple, for example
>   echo <password> | cryptsetup bitlkOpen bitlk_image.img test
> 
> The Elephant diffuser uses two rotations in opposite direction
> for data (Diffuser A and B) and also XOR operation with Sector key
> over the sector data; Sector key is derived from additional key data.
> The original public documentation is available here
>   http://download.microsoft.com/download/0/2/3/0238acaf-d3bf-4a6d-b3d6-0a0be4bbb36e/bitlockercipher200608.pdf
> 
> The dm-crypt implementation is embedded to "elephant" IV
> (similar to tcw IV construction).
> 
> Because we cannot modify original bio data for write (before
> encryption), an additional internal flag to pre-process data is added.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>

Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>


> ---
>  drivers/md/dm-crypt.c | 323 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 319 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index eb9782fc93fe..f9370a1a574b 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1,8 +1,8 @@
>  /*
>   * Copyright (C) 2003 Jana Saout <jana@saout.de>
>   * Copyright (C) 2004 Clemens Fruhwirth <clemens@endorphin.org>
> - * Copyright (C) 2006-2017 Red Hat, Inc. All rights reserved.
> - * Copyright (C) 2013-2017 Milan Broz <gmazyland@gmail.com>
> + * Copyright (C) 2006-2020 Red Hat, Inc. All rights reserved.
> + * Copyright (C) 2013-2020 Milan Broz <gmazyland@gmail.com>
>   *
>   * This file is released under the GPL.
>   */
> @@ -115,6 +115,11 @@ struct iv_tcw_private {
>  	u8 *whitening;
>  };
>  
> +#define ELEPHANT_MAX_KEY_SIZE 32
> +struct iv_elephant_private {
> +	struct crypto_skcipher *tfm;
> +};
> +
>  /*
>   * Crypt: maps a linear range of a block device
>   * and encrypts / decrypts at the same time.
> @@ -125,6 +130,7 @@ enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
>  enum cipher_flags {
>  	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
>  	CRYPT_IV_LARGE_SECTORS,		/* Calculate IV from sector_size, not 512B sectors */
> +	CRYPT_ENCRYPT_PREPROCESS,	/* Must preprocess data for encryption (elephant) */
>  };
>  
>  /*
> @@ -152,6 +158,7 @@ struct crypt_config {
>  		struct iv_benbi_private benbi;
>  		struct iv_lmk_private lmk;
>  		struct iv_tcw_private tcw;
> +		struct iv_elephant_private elephant;
>  	} iv_gen_private;
>  	u64 iv_offset;
>  	unsigned int iv_size;
> @@ -285,6 +292,11 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
>   * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
>   *        The IV is encrypted little-endian byte-offset (with the same key
>   *        and cipher as the volume).
> + *
> + * elephant: The extended version of eboiv with additional Elephant diffuser
> + *           used with Bitlocker CBC mode.
> + *           This mode was used in older Windows systems
> + *           http://download.microsoft.com/download/0/2/3/0238acaf-d3bf-4a6d-b3d6-0a0be4bbb36e/bitlockercipher200608.pdf
>   */
>  
>  static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
> @@ -734,6 +746,290 @@ static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
>  	return err;
>  }
>  
> +static void crypt_iv_elephant_dtr(struct crypt_config *cc)
> +{
> +	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
> +
> +	crypto_free_skcipher(elephant->tfm);
> +	elephant->tfm = NULL;
> +}
> +
> +static int crypt_iv_elephant_ctr(struct crypt_config *cc, struct dm_target *ti,
> +			    const char *opts)
> +{
> +	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
> +	int r;
> +
> +	elephant->tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
> +	if (IS_ERR(elephant->tfm)) {
> +		r = PTR_ERR(elephant->tfm);
> +		elephant->tfm = NULL;
> +		return r;
> +	}
> +
> +	r = crypt_iv_eboiv_ctr(cc, ti, NULL);
> +	if (r)
> +		crypt_iv_elephant_dtr(cc);
> +	return r;
> +}
> +
> +static void diffuser_disk_to_cpu(u32 *d, size_t n)
> +{
> +#ifndef __LITTLE_ENDIAN
> +	int i;
> +
> +	for (i = 0; i < n; i++)
> +		d[i] = le32_to_cpu((__le32)d[i]);
> +#endif
> +}
> +
> +static void diffuser_cpu_to_disk(__le32 *d, size_t n)
> +{
> +#ifndef __LITTLE_ENDIAN
> +	int i;
> +
> +	for (i = 0; i < n; i++)
> +		d[i] = cpu_to_le32((u32)d[i]);
> +#endif
> +}
> +
> +static void diffuser_a_decrypt(u32 *d, size_t n)
> +{
> +	int i, i1, i2, i3;
> +
> +	for (i = 0; i < 5; i++) {
> +		i1 = 0;
> +		i2 = n - 2;
> +		i3 = n - 5;
> +
> +		while (i1 < (n - 1)) {
> +			d[i1] += d[i2] ^ (d[i3] << 9 | d[i3] >> 23);
> +			i1++; i2++; i3++;
> +
> +			if (i3 >= n)
> +				i3 -= n;
> +
> +			d[i1] += d[i2] ^ d[i3];
> +			i1++; i2++; i3++;
> +
> +			if (i2 >= n)
> +				i2 -= n;
> +
> +			d[i1] += d[i2] ^ (d[i3] << 13 | d[i3] >> 19);
> +			i1++; i2++; i3++;
> +
> +			d[i1] += d[i2] ^ d[i3];
> +			i1++; i2++; i3++;
> +		}
> +	}
> +}
> +
> +static void diffuser_a_encrypt(u32 *d, size_t n)
> +{
> +	int i, i1, i2, i3;
> +
> +	for (i = 0; i < 5; i++) {
> +		i1 = n - 1;
> +		i2 = n - 2 - 1;
> +		i3 = n - 5 - 1;
> +
> +		while (i1 > 0) {
> +			d[i1] -= d[i2] ^ d[i3];
> +			i1--; i2--; i3--;
> +
> +			d[i1] -= d[i2] ^ (d[i3] << 13 | d[i3] >> 19);
> +			i1--; i2--; i3--;
> +
> +			if (i2 < 0)
> +				i2 += n;
> +
> +			d[i1] -= d[i2] ^ d[i3];
> +			i1--; i2--; i3--;
> +
> +			if (i3 < 0)
> +				i3 += n;
> +
> +			d[i1] -= d[i2] ^ (d[i3] << 9 | d[i3] >> 23);
> +			i1--; i2--; i3--;
> +		}
> +	}
> +}
> +
> +static void diffuser_b_decrypt(u32 *d, size_t n)
> +{
> +	int i, i1, i2, i3;
> +
> +	for (i = 0; i < 3; i++) {
> +		i1 = 0;
> +		i2 = 2;
> +		i3 = 5;
> +
> +		while (i1 < (n - 1)) {
> +			d[i1] += d[i2] ^ d[i3];
> +			i1++; i2++; i3++;
> +
> +			d[i1] += d[i2] ^ (d[i3] << 10 | d[i3] >> 22);
> +			i1++; i2++; i3++;
> +
> +			if (i2 >= n)
> +				i2 -= n;
> +
> +			d[i1] += d[i2] ^ d[i3];
> +			i1++; i2++; i3++;
> +
> +			if (i3 >= n)
> +				i3 -= n;
> +
> +			d[i1] += d[i2] ^ (d[i3] << 25 | d[i3] >> 7);
> +			i1++; i2++; i3++;
> +		}
> +	}
> +}
> +
> +static void diffuser_b_encrypt(u32 *d, size_t n)
> +{
> +	int i, i1, i2, i3;
> +
> +	for (i = 0; i < 3; i++) {
> +		i1 = n - 1;
> +		i2 = 2 - 1;
> +		i3 = 5 - 1;
> +
> +		while (i1 > 0) {
> +			d[i1] -= d[i2] ^ (d[i3] << 25 | d[i3] >> 7);
> +			i1--; i2--; i3--;
> +
> +			if (i3 < 0)
> +				i3 += n;
> +
> +			d[i1] -= d[i2] ^ d[i3];
> +			i1--; i2--; i3--;
> +
> +			if (i2 < 0)
> +				i2 += n;
> +
> +			d[i1] -= d[i2] ^ (d[i3] << 10 | d[i3] >> 22);
> +			i1--; i2--; i3--;
> +
> +			d[i1] -= d[i2] ^ d[i3];
> +			i1--; i2--; i3--;
> +		}
> +	}
> +}
> +
> +static int crypt_iv_elephant(struct crypt_config *cc, struct dm_crypt_request *dmreq)
> +{
> +	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
> +	u8 *es, *ks, *data, *data2, *data_offset;
> +	struct skcipher_request *req;
> +	struct scatterlist *sg, *sg2, src, dst;
> +	struct crypto_wait wait;
> +	int i, r;
> +
> +	req = skcipher_request_alloc(elephant->tfm, GFP_NOIO);
> +	es = kzalloc(16, GFP_NOIO); /* Key for AES */
> +	ks = kzalloc(32, GFP_NOIO); /* Elephant sector key */
> +
> +	if (!req || !es || !ks) {
> +		r = -ENOMEM;
> +		goto out;
> +	}
> +
> +	*(__le64 *)es = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> +
> +	/* E(Ks, e(s)) */
> +	sg_init_one(&src, es, 16);
> +	sg_init_one(&dst, ks, 16);
> +	skcipher_request_set_crypt(req, &src, &dst, 16, NULL);
> +	skcipher_request_set_callback(req, 0, crypto_req_done, &wait);
> +	r = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> +	if (r)
> +		goto out;
> +
> +	/* E(Ks, e'(s)) */
> +	es[15] = 0x80;
> +	sg_init_one(&dst, &ks[16], 16);
> +	r = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> +	if (r)
> +		goto out;
> +
> +	sg = crypt_get_sg_data(cc, dmreq->sg_out);
> +	data = kmap_atomic(sg_page(sg));
> +	data_offset = data + sg->offset;
> +
> +	/* Cannot modify original bio, copy to sg_out and apply Elephant to it */
> +	if (bio_data_dir(dmreq->ctx->bio_in) == WRITE) {
> +		sg2 = crypt_get_sg_data(cc, dmreq->sg_in);
> +		data2 = kmap_atomic(sg_page(sg2));
> +		memcpy(data_offset, data2 + sg2->offset, cc->sector_size);
> +		kunmap_atomic(data2);
> +	}
> +
> +	if (bio_data_dir(dmreq->ctx->bio_in) != WRITE) {
> +		diffuser_disk_to_cpu((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_b_decrypt((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_a_decrypt((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_cpu_to_disk((__le32*)data_offset, cc->sector_size / sizeof(u32));
> +	}
> +
> +	for (i = 0; i < (cc->sector_size / 32); i++)
> +		crypto_xor(data_offset + i * 32, ks, 32);
> +
> +	if (bio_data_dir(dmreq->ctx->bio_in) == WRITE) {
> +		diffuser_disk_to_cpu((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_a_encrypt((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_b_encrypt((u32*)data_offset, cc->sector_size / sizeof(u32));
> +		diffuser_cpu_to_disk((__le32*)data_offset, cc->sector_size / sizeof(u32));
> +	}
> +
> +	kunmap_atomic(data);
> +out:
> +	kzfree(ks);
> +	kzfree(es);
> +	skcipher_request_free(req);
> +	return r;
> +}
> +
> +static int crypt_iv_elephant_gen(struct crypt_config *cc, u8 *iv,
> +			    struct dm_crypt_request *dmreq)
> +{
> +	int r;
> +
> +	if (bio_data_dir(dmreq->ctx->bio_in) == WRITE) {
> +		r = crypt_iv_elephant(cc, dmreq);
> +		if (r)
> +			return r;
> +	}
> +
> +	return crypt_iv_eboiv_gen(cc, iv, dmreq);
> +}
> +
> +static int crypt_iv_elephant_post(struct crypt_config *cc, u8 *iv,
> +				  struct dm_crypt_request *dmreq)
> +{
> +	if (bio_data_dir(dmreq->ctx->bio_in) != WRITE)
> +		return crypt_iv_elephant(cc, dmreq);
> +
> +	return 0;
> +}
> +
> +static int crypt_iv_elephant_init(struct crypt_config *cc)
> +{
> +	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
> +	int key_offset = cc->key_size - cc->key_extra_size;
> +
> +	return crypto_skcipher_setkey(elephant->tfm, &cc->key[key_offset], cc->key_extra_size);
> +}
> +
> +static int crypt_iv_elephant_wipe(struct crypt_config *cc)
> +{
> +	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
> +	u8 key[ELEPHANT_MAX_KEY_SIZE];
> +
> +	memset(key, 0, cc->key_extra_size);
> +	return crypto_skcipher_setkey(elephant->tfm, key, cc->key_extra_size);
> +}
> +
>  static const struct crypt_iv_operations crypt_iv_plain_ops = {
>  	.generator = crypt_iv_plain_gen
>  };
> @@ -787,6 +1083,15 @@ static struct crypt_iv_operations crypt_iv_eboiv_ops = {
>  	.generator = crypt_iv_eboiv_gen
>  };
>  
> +static struct crypt_iv_operations crypt_iv_elephant_ops = {
> +	.ctr	   = crypt_iv_elephant_ctr,
> +	.dtr	   = crypt_iv_elephant_dtr,
> +	.init	   = crypt_iv_elephant_init,
> +	.wipe	   = crypt_iv_elephant_wipe,
> +	.generator = crypt_iv_elephant_gen,
> +	.post	   = crypt_iv_elephant_post
> +};
> +
>  /*
>   * Integrity extensions
>   */
> @@ -1103,6 +1408,9 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
>  			r = cc->iv_gen_ops->generator(cc, org_iv, dmreq);
>  			if (r < 0)
>  				return r;
> +			/* Data can be already preprocessed in generator */
> +			if (test_bit(CRYPT_ENCRYPT_PREPROCESS, &cc->cipher_flags))
> +				sg_in = sg_out;
>  			/* Store generated IV in integrity metadata */
>  			if (cc->integrity_iv_size)
>  				memcpy(tag_iv, org_iv, cc->integrity_iv_size);
> @@ -2191,7 +2499,14 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
>  		cc->iv_gen_ops = &crypt_iv_null_ops;
>  	else if (strcmp(ivmode, "eboiv") == 0)
>  		cc->iv_gen_ops = &crypt_iv_eboiv_ops;
> -	else if (strcmp(ivmode, "lmk") == 0) {
> +	else if (strcmp(ivmode, "elephant") == 0) {
> +		cc->iv_gen_ops = &crypt_iv_elephant_ops;
> +		cc->key_parts = 2;
> +		cc->key_extra_size = cc->key_size / 2;
> +		if (cc->key_extra_size > ELEPHANT_MAX_KEY_SIZE)
> +			return -EINVAL;
> +		set_bit(CRYPT_ENCRYPT_PREPROCESS, &cc->cipher_flags);
> +	} else if (strcmp(ivmode, "lmk") == 0) {
>  		cc->iv_gen_ops = &crypt_iv_lmk_ops;
>  		/*
>  		 * Version 2 and 3 is recognised according
> @@ -2959,7 +3274,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  static struct target_type crypt_target = {
>  	.name   = "crypt",
> -	.version = {1, 19, 0},
> +	.version = {1, 20, 0},
>  	.module = THIS_MODULE,
>  	.ctr    = crypt_ctr,
>  	.dtr    = crypt_dtr,
> -- 
> 2.25.0.rc0
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

