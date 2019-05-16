Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC22206D2
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 14:23:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 320BE30C1AF9;
	Thu, 16 May 2019 12:23:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6252E198;
	Thu, 16 May 2019 12:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 158661843501;
	Thu, 16 May 2019 12:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4G95U7W015910 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 05:05:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1CD1608A6; Thu, 16 May 2019 09:05:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC2F60928
	for <dm-devel@redhat.com>; Thu, 16 May 2019 09:05:27 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2286BC074EF4
	for <dm-devel@redhat.com>; Thu, 16 May 2019 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=eckner.net;
	s=szilassi; t=1557997484;
	bh=1wCua/ev6gA4FVa7YUCKRRv1B1b+YZIQ4Cdc1Lvuka0=; l=3341;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LOiaeEhvvIqQIk1pt2Tou31p9F7TUD5ziKpwcjdYWtjkrFKBv31bKBaFtBbaaRUua
	GU2GvltJgAzn0S97mULzIsU9OE5jejyF5Br3P7jDtfmua4IPCw1Wfk1pQ2LwM1kXhj
	GILWGLq3bWRa+elQNCCm58TSbiyI5X57KlW3/0Cosz1DFlzpLUoDiqIBfOG7ytFgtp
	mIahFrEnM/Ljofo0w56q6KRKQaBnAzt3wbGZn75JhFP7SboCa+MAWmbYDOIlmHbsA0
	ibpGWJpE8PoDDmQBPqhAEL9WmYBPN2al9Nj66tshWvAEqUlJgQRVgyrKb+ezxCzJcA
	oEyx542zcGLPQ==
Received-SPF: none (Address does not pass the Sender Policy Framework)
	SPF=HELO; sender=nlopc43.ioq.uni-jena.de;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
Received-SPF: fail (Address does not pass the Sender Policy Framework)
	SPF=MAILFROM; sender=dm-devel@eckner.net;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
Received: from nlopc43.ioq.uni-jena.de (nlopc43.ioq.uni-jena.de
	[::ffff:141.35.50.156]) (AUTH: CRAM-MD5 erich@eckner.net, )
	by szilassi.eckner.net with ESMTPSA
	id 0000000000741276.000000005CDD27AC.00004BE7;
	Thu, 16 May 2019 11:04:44 +0200
Date: Thu, 16 May 2019 11:04:37 +0200 (CEST)
From: Erich Eckner <dm-devel@eckner.net>
X-X-Sender: erich@nlopc43.ioq.uni-jena.de
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <20190515142231.30590-1-gmazyland@gmail.com>
Message-ID: <alpine.LNX.2.21.9999.1905161101060.2715@nlopc43.ioq.uni-jena.de>
References: <alpine.LNX.2.21.9999.1905141138180.19368@nlopc43.ioq.uni-jena.de>
	<20190515142231.30590-1-gmazyland@gmail.com>
User-Agent: Alpine 2.21.9999 (LNX 339 2019-05-08)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="596483122-1063363029-1557997484=:2715"
Received-SPF: fail (Address does not pass the Sender Policy Framework)
	SPF=FROM; sender=dm-devel@eckner.net;
	remoteip=::ffff:141.35.50.156;
	remotehost=nlopc43.ioq.uni-jena.de; helo=nlopc43.ioq.uni-jena.de;
	receiver=szilassi.eckner.net;
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 16 May 2019 09:05:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 16 May 2019 09:05:12 +0000 (UTC) for IP:'193.30.121.109'
	DOMAIN:'szilassi.eckner.net' HELO:'szilassi.eckner.net'
	FROM:'dm-devel@eckner.net' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_PASS) 193.30.121.109 szilassi.eckner.net
	193.30.121.109 szilassi.eckner.net <dm-devel@eckner.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 16 May 2019 08:22:43 -0400
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] dm-crypt: print device name in integrity
 error message.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 16 May 2019 12:23:11 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--596483122-1063363029-1557997484=:2715
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

thanks for the fast patch - I applied it on top of 5.1.2 and it has the 
desired result. (It took some time to trigger the read errors, though 
;-b):

[ 8834.156713] device-mapper: crypt: dm-17: INTEGRITY AEAD ERROR, sector 
1595877368
[ 9713.463619] device-mapper: crypt: dm-17: INTEGRITY AEAD ERROR, sector 
1595877040


regards,
Erich Eckner
Friedrich-Schiller-Universität Jena
Institut für Optik und Quantenelektronik
Helmholtzweg 4
07743 Jena

Tel. +49 3641 9-47238


On Wed, 15 May 2019, Milan Broz wrote:

> This message should better identify the device with the integrity failure.
>
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---
> drivers/md/dm-crypt.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 7f6462f74ac8..36dfa36505ed 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1143,9 +1143,11 @@ static int crypt_convert_block_aead(struct crypt_config *cc,
> 		r = crypto_aead_decrypt(req);
> 	}
>
> -	if (r == -EBADMSG)
> -		DMERR_LIMIT("INTEGRITY AEAD ERROR, sector %llu",
> +	if (r == -EBADMSG) {
> +		char b[BDEVNAME_SIZE];
> +		DMERR_LIMIT("%s: INTEGRITY AEAD ERROR, sector %llu", bio_devname(ctx->bio_in, b),
> 			    (unsigned long long)le64_to_cpu(*sector));
> +	}
>
> 	if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
> 		r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
> @@ -1788,7 +1790,8 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
> 		error = cc->iv_gen_ops->post(cc, org_iv_of_dmreq(cc, dmreq), dmreq);
>
> 	if (error == -EBADMSG) {
> -		DMERR_LIMIT("INTEGRITY AEAD ERROR, sector %llu",
> +		char b[BDEVNAME_SIZE];
> +		DMERR_LIMIT("%s: INTEGRITY AEAD ERROR, sector %llu", bio_devname(ctx->bio_in, b),
> 			    (unsigned long long)le64_to_cpu(*org_sector_of_dmreq(cc, dmreq)));
> 		io->error = BLK_STS_PROTECTION;
> 	} else if (error < 0)
> -- 
> 2.20.1
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3p92iMrPBP64GmxZCu7JB1Xae1oFAlzdJ6cACgkQCu7JB1Xa
e1raZQ/+PbM9H3gLyVYsUMw5uNA5galb88AD7vkHbSGRrERjZiDIDFvA35wLnBQt
/K+GKvFnPiM3qlceYCRYTEfPVO/8SRPDkGg8h55ArdmGpgWUfagvFCJYiJKe7gRu
SMjOXMYkA0187jB5YarEbCSYEDsrJr8wtBfwlHYgQ7pMbU6ua/l6KHGPG3abznZ9
PC6US1y6QX3lrMqZwKmdfijZGIlJ8Tf1KdagTMZbDs74MTpzLwOoNdQbNLv/yA3o
PLpXSrbPXZnVkL6VWpjBfCwgjFSqPlScwqwgDZJRbtiSmsOcTFtDke974KMoGMTe
MfnXe0YTMu4TvP1wAuDk3SztTw59RsAnTjS1JUkR11fjV1uZgTqkPtmm21XpI9Op
mMVCPjcCVq96uYT4CkY17B4Ukj4VT0rFb/47WKpcl66jvC4q3rIdnq9124IClnEw
eWZAz6KDLb6q3Z7/k3lSpSXmc9yQMBsOrzCMHv36N62RfoDFV8139gw5PjZNgnRm
KUX9SUSw+nPpUvcqajJwb7LJDf+jueCG6rhzQVGknvt693YQ49gWwgsheoT+d8fS
YBQgSq4ZNV5tGHBgfm6qOEi2/JTnyBl8b41IOarh/aYjLILyg6cTSU0FevT2eii+
JeRQtJCsoDl4FmhCXKd9+DHB+vTZ9h3ZRizIx6+Sm9uNcqDOVs0=
=lei7
-----END PGP SIGNATURE-----
--596483122-1063363029-1557997484=:2715
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--596483122-1063363029-1557997484=:2715--

