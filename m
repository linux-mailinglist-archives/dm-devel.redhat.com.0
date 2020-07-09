Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C9EBB2197E9
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 07:32:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-C-p1rxrzPBClbXbXsZhmow-1; Thu, 09 Jul 2020 01:32:12 -0400
X-MC-Unique: C-p1rxrzPBClbXbXsZhmow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF9EC1083;
	Thu,  9 Jul 2020 05:32:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49D3560F8D;
	Thu,  9 Jul 2020 05:32:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BC541809547;
	Thu,  9 Jul 2020 05:31:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0695Vblx031694 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 01:31:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D6B15C298; Thu,  9 Jul 2020 05:31:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-195.bne.redhat.com [10.64.54.195])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBD95C1D3;
	Thu,  9 Jul 2020 05:31:34 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jtP9a-0004eC-Hl; Thu, 09 Jul 2020 15:31:27 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Thu, 09 Jul 2020 15:31:26 +1000
Date: Thu, 9 Jul 2020 15:31:26 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200709053126.GA5510@gondor.apana.org.au>
MIME-Version: 1.0
In-Reply-To: <20200701045217.121126-3-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, mpatocka@redhat.com, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/6] crypto: algapi - use common mechanism
 for inheriting flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Eric Biggers <ebiggers@kernel.org> wrote:
>
> @@ -875,14 +873,21 @@ static void cbcmac_exit_tfm(struct crypto_tfm *tfm)
> 
> static int cbcmac_create(struct crypto_template *tmpl, struct rtattr **tb)
> {
> +       struct crypto_attr_type *algt;
>        struct shash_instance *inst;
>        struct crypto_cipher_spawn *spawn;
>        struct crypto_alg *alg;
> +       u32 mask;
>        int err;
> 
> -       err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_SHASH);
> -       if (err)
> -               return err;
> +       algt = crypto_get_attr_type(tb);
> +       if (IS_ERR(algt))
> +               return PTR_ERR(algt);
> +
> +       if ((algt->type ^ CRYPTO_ALG_TYPE_SHASH) & algt->mask)
> +               return -EINVAL;
> +
> +       mask = crypto_algt_inherited_mask(algt);

How about moving the types check into crypto_algt_inherited_mask,
e.g.,

	u32 mask;
	int err;

	err = crypto_algt_inherited_mask(tb, CRYPTO_ALG_TYPE_SHASH);
	if (err < 0)
		return err;

	mask = err;

This could then be used to simplify other templates too, such as
gcm.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

