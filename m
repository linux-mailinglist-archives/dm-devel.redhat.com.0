Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 569D820EBD8
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 05:10:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203--Vn3RstgMV6heaW1KNvhJg-1; Mon, 29 Jun 2020 23:10:39 -0400
X-MC-Unique: -Vn3RstgMV6heaW1KNvhJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4695FBFC1;
	Tue, 30 Jun 2020 03:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DACDE9CFFD;
	Tue, 30 Jun 2020 03:10:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D56D8789B;
	Tue, 30 Jun 2020 03:10:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U3ACff012617 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 23:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DC00B3A61; Tue, 30 Jun 2020 03:10:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7026B3A62;
	Tue, 30 Jun 2020 03:10:06 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jq6eW-0007F8-FF; Tue, 30 Jun 2020 13:09:45 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Tue, 30 Jun 2020 13:09:44 +1000
Date: Tue, 30 Jun 2020 13:09:44 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200630030944.GA20706@gondor.apana.org.au>
References: <20200626210302.1813-1-ignat@cloudflare.com>
	<CY4PR04MB375127DC313F70875CAAC841E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB375127DC313F70875CAAC841E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm crypt: add flags to optionally bypass
 dm-crypt workqueues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 02:51:17AM +0000, Damien Le Moal wrote:
>
> > @@ -1463,12 +1465,12 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
> >  	 * requests if driver request queue is full.
> >  	 */
> >  	skcipher_request_set_callback(ctx->r.req,
> > -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +	    nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
> >  	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> 
> Will not specifying CRYPTO_TFM_REQ_MAY_BACKLOG always cause the crypto API to
> return -EBUSY ? From the comment above the skcipher_request_set_callback(), it
> seems that this will be the case only if the skcipher diver queue is full. So in
> other word, keeping the kcryptd_async_done() callback and executing the skcipher
> request through crypt_convert() and crypt_convert_block_skcipher() may still end
> up being an asynchronous operation. Can you confirm this and is it what you
> intended to implement ?

The purpose of MAY_BACKLOG is to make the crypto request reliable.
It has nothing to do with whether the request will be synchronous
or not.

Without the backlog flag, if the hardware queue is full the request
will simply be dropped, which is appropriate in the network stack
with IPsec where congestion can be dealt with at the source.

Block layer on the other hand should always use the backlog flag
and stop sending more requests to the crypto API until the congestion
goes away.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

