Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4698B21AF8B
	for <lists+dm-devel@lfdr.de>; Fri, 10 Jul 2020 08:38:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-ZoaZg1_pNX25hMS93J16oA-1; Fri, 10 Jul 2020 02:38:25 -0400
X-MC-Unique: ZoaZg1_pNX25hMS93J16oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67E51092;
	Fri, 10 Jul 2020 06:38:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7CA70100;
	Fri, 10 Jul 2020 06:38:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6120A72F48;
	Fri, 10 Jul 2020 06:38:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06A6c33F007339 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 02:38:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D1BF10013D4; Fri, 10 Jul 2020 06:38:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-195.bne.redhat.com [10.64.54.195])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F7271002380;
	Fri, 10 Jul 2020 06:38:00 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jtmfS-0006IF-3g; Fri, 10 Jul 2020 16:37:55 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Fri, 10 Jul 2020 16:37:54 +1000
Date: Fri, 10 Jul 2020 16:37:54 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200710063753.GA1974@gondor.apana.org.au>
References: <20200701045217.121126-3-ebiggers@kernel.org>
	<20200709053126.GA5510@gondor.apana.org.au>
	<20200710062403.GB2805@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200710062403.GB2805@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Thu, Jul 09, 2020 at 11:24:03PM -0700, Eric Biggers wrote:
>
> I decided to make crypto_check_attr_type() return the mask instead, and do so
> via a pointer argument instead of the return value (so that we don't overload an
> errno return value and prevent flag 0x80000000 from working).
> Please take a look at v2.  Thanks!

Looks good.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

