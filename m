Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93C6A29959B
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 19:44:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-DEALK0N_Nl23GUI3sUmCOg-1; Mon, 26 Oct 2020 14:44:55 -0400
X-MC-Unique: DEALK0N_Nl23GUI3sUmCOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5E61009E32;
	Mon, 26 Oct 2020 18:44:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F8A5C1BB;
	Mon, 26 Oct 2020 18:44:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D580392F2B;
	Mon, 26 Oct 2020 18:44:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QIgCTk009019 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 14:42:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FCE95B4AF; Mon, 26 Oct 2020 18:42:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-202.bne.redhat.com [10.64.54.202])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4789E5B4B2;
	Mon, 26 Oct 2020 18:42:06 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1kX7RM-0006ql-2t; Tue, 27 Oct 2020 05:41:57 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Tue, 27 Oct 2020 05:41:56 +1100
Date: Tue, 27 Oct 2020 05:41:56 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201026184155.GA6863@gondor.apana.org.au>
References: <20201026130450.6947-1-gilad@benyossef.com>
	<20201026130450.6947-4-gilad@benyossef.com>
	<20201026175231.GG858@sol.localdomain>
	<d07b062c-1405-4d72-b907-1c4dfa97aecb@gmail.com>
	<20201026183936.GJ858@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201026183936.GJ858@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-raid@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>,
	Alasdair Kergon <agk@redhat.com>, Ofir Drang <ofir.drang@arm.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm crypt: switch to EBOIV crypto API
	template
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

On Mon, Oct 26, 2020 at 11:39:36AM -0700, Eric Biggers wrote:
> 
> CONFIG_DM_CRYPT can either select every weird combination of algorithms anyone
> can ever be using, or it can select some defaults and require any other needed
> algorithms to be explicitly selected.
> 
> In reality, dm-crypt has never even selected any particular block ciphers, even
> AES.  Nor has it ever selected XTS.  So it's actually always made users (or
> kernel distributors) explicitly select algorithms.  Why the Bitlocker support
> suddenly different?
> 
> I'd think a lot of dm-crypt users don't want to bloat their kernels with random
> legacy algorithms.

The point is that people rebuilding their kernel can end up with a
broken system.  Just set a default on EBOIV if dm-crypt is on.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

