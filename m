Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C28D29E332
	for <lists+dm-devel@lfdr.de>; Thu, 29 Oct 2020 05:04:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-mibGV8ClNMuvNwRx-Yn37Q-1; Thu, 29 Oct 2020 00:04:43 -0400
X-MC-Unique: mibGV8ClNMuvNwRx-Yn37Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F7B110866B2;
	Thu, 29 Oct 2020 04:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7975D9EF;
	Thu, 29 Oct 2020 04:04:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B876180B658;
	Thu, 29 Oct 2020 04:04:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09T3scXf013940 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 23:54:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3492762A0B; Thu, 29 Oct 2020 03:54:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-202.bne.redhat.com [10.64.54.202])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A04CD5578F;
	Thu, 29 Oct 2020 03:54:29 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1kXz12-0007pU-3R; Thu, 29 Oct 2020 14:54:21 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Thu, 29 Oct 2020 14:54:20 +1100
Date: Thu, 29 Oct 2020 14:54:20 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Gilad Ben-Yossef <gilad@benyossef.com>
Message-ID: <20201029035419.GA19506@gondor.apana.org.au>
References: <20201026130450.6947-1-gilad@benyossef.com>
	<20201026130450.6947-4-gilad@benyossef.com>
	<20201026175231.GG858@sol.localdomain>
	<d07b062c-1405-4d72-b907-1c4dfa97aecb@gmail.com>
	<20201026183936.GJ858@sol.localdomain>
	<20201026184155.GA6863@gondor.apana.org.au>
	<20201026184402.GA6908@gondor.apana.org.au>
	<CAOtvUMf-xv5cHTjExW2Ffx6soLavFztow6DwE6Qo5pffF0N5uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOtvUMf-xv5cHTjExW2Ffx6soLavFztow6DwE6Qo5pffF0N5uw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@kernel.org>, Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>,
	Ofir Drang <ofir.drang@arm.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 28, 2020 at 01:41:28PM +0200, Gilad Ben-Yossef wrote:
>
> Sorry if I'm being daft, but what did you refer to be "an existing
> option"? there was no CONFIG_EBOIV before my patchset, it was simply
> built as part of dm-crypt so it seems that setting CONFIG_EBOIV
> default to dm-crypto Kconfig option value does solves the problem, or
> have I missed something?

Oh I'm mistaken then.  I thought it was an existing option.  If
it's a new option then a default depending on dm-crypt should be
sufficient.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

