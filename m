Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9711120AC1F
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 08:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593151719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9N++jInLUBO+h7aJStG8PTDhg0iuO0HWztb+U4ibN10=;
	b=YlosEbfJB2fKkTdZquoUO/Furxzzeo67HBXwRaWFfo0U4Wtn5VM27vOa1esTTfiBPSiUyv
	GBz3sR1UCkvNTJKaojHQOqeLZY5HxYF7vU/O4sTwQpR22HMDA+nF4FJ6+PRxAhr8pwS8gi
	4iSO7Y3qfblrVvHL+neysAvbH/kRpRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-TkUOMjXRP1eZRr-myS96ig-1; Fri, 26 Jun 2020 02:08:36 -0400
X-MC-Unique: TkUOMjXRP1eZRr-myS96ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA793107ACCA;
	Fri, 26 Jun 2020 06:08:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC2617B60E;
	Fri, 26 Jun 2020 06:08:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A78F51809543;
	Fri, 26 Jun 2020 06:08:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05Q680e0007799 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 02:08:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34415101E66C; Fri, 26 Jun 2020 06:08:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2781025EB7;
	Fri, 26 Jun 2020 06:07:57 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1johWZ-0004Vo-Cs; Fri, 26 Jun 2020 16:07:44 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Fri, 26 Jun 2020 16:07:43 +1000
Date: Fri, 26 Jun 2020 16:07:43 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200626060743.GA20860@gondor.apana.org.au>
References: <20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161102250.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616175022.GD207319@gmail.com>
	<alpine.LRH.2.02.2006161416510.12390@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616182327.GE207319@gmail.com>
	<alpine.LRH.2.02.2006170940510.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006170946590.18714@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006170946590.18714@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zaibo Xu <xuzaibo@huawei.com>,
	linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] cpt-crypto: don't sleep of
 CRYPTO_TFM_REQ_MAY_SLEEP was not specified
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 17, 2020 at 09:48:56AM -0400, Mikulas Patocka wrote:
> There is this call chain:
> cvm_encrypt -> cvm_enc_dec -> cptvf_do_request -> process_request -> kzalloc
> where we call sleeping allocator function even if CRYPTO_TFM_REQ_MAY_SLEEP 
> was not specified.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v4.11+
> Fixes: c694b233295b ("crypto: cavium - Add the Virtual Function driver for CPT")
> 
> ---
>  drivers/crypto/cavium/cpt/cptvf_algs.c       |    1 +
>  drivers/crypto/cavium/cpt/cptvf_reqmanager.c |   12 ++++++------
>  drivers/crypto/cavium/cpt/request_manager.h  |    2 ++
>  3 files changed, 9 insertions(+), 6 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

