Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD26B968C
	for <lists+dm-devel@lfdr.de>; Fri, 20 Sep 2019 19:37:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B9F63082A8D;
	Fri, 20 Sep 2019 17:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2FE5C1B5;
	Fri, 20 Sep 2019 17:37:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 544CD2551C;
	Fri, 20 Sep 2019 17:37:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8KHbD7k027718 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Sep 2019 13:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F172A601AC; Fri, 20 Sep 2019 17:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A4A600C6;
	Fri, 20 Sep 2019 17:37:08 +0000 (UTC)
Date: Fri, 20 Sep 2019 13:37:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Thibaut Sautereau <thibaut.sautereau@clip-os.org>,
	Milan Broz <gmazyland@gmail.com>
Message-ID: <20190920173707.GA21143@redhat.com>
References: <20190920154434.GA923@gandi.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920154434.GA923@gandi.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt error when CONFIG_CRYPTO_AUTHENC is disabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 20 Sep 2019 17:37:58 +0000 (UTC)

On Fri, Sep 20 2019 at 11:44am -0400,
Thibaut Sautereau <thibaut.sautereau@clip-os.org> wrote:

> Hi,
> 
> I just got a dm-crypt "crypt: Error allocating crypto tfm" error when
> trying to "cryptsetup open" a volume. I found out that it was only
> happening when I disabled CONFIG_CRYPTO_AUTHENC.
> 
> drivers/md/dm-crypt.c includes the crypto/authenc.h header and seems to
> use some CRYPTO_AUTHENC-related stuff. Therefore, shouldn't
> CONFIG_DM_CRYPT select CONFIG_CRYPTO_AUTHENC?

Yes, it looks like commit ef43aa38063a6 ("dm crypt: add cryptographic
data integrity protection (authenticated encryption)") should've added
'select CRYPTO_AUTHENC' to dm-crypt's Kconfig.  I'll let Milan weigh-in
but that seems like the right way forward.

Thanks for your report!
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
