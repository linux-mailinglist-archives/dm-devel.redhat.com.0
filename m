Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A134A75A7
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 22:51:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9F39308339B;
	Tue,  3 Sep 2019 20:51:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF61B5DA8C;
	Tue,  3 Sep 2019 20:51:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CF7E1802217;
	Tue,  3 Sep 2019 20:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83KpUda026843 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 16:51:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64ED26012E; Tue,  3 Sep 2019 20:51:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB0D960126;
	Tue,  3 Sep 2019 20:51:27 +0000 (UTC)
Date: Tue, 3 Sep 2019 16:51:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190903205126.GA13753@redhat.com>
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
	<20190819141738.1231-6-ard.biesheuvel@linaro.org>
	<20190903185537.GC13472@redhat.com>
	<CAKv+Gu8wr3HnP7uVDAOY=o54dWVkPoWm5V43LU_QNVMK_Cc2GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8wr3HnP7uVDAOY=o54dWVkPoWm5V43LU_QNVMK_Cc2GA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	device-mapper development <dm-devel@redhat.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>, linux-fscrypt@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v13 5/6] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 03 Sep 2019 20:51:55 +0000 (UTC)

On Tue, Sep 03 2019 at  3:16pm -0400,
Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> On Tue, 3 Sep 2019 at 11:55, Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Mon, Aug 19 2019 at 10:17am -0400,
> > Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > > Replace the explicit ESSIV handling in the dm-crypt driver with calls
> > > into the crypto API, which now possesses the capability to perform
> > > this processing within the crypto subsystem.
> > >
> > > Note that we reorder the AEAD cipher_api string parsing with the TFM
> > > instantiation: this is needed because cipher_api is mangled by the
> > > ESSIV handling, and throws off the parsing of "authenc(" otherwise.
> > >
> > > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> >
> > I really like to see this type of factoring out to the crypto API;
> > nicely done.
> >
> > Acked-by: Mike Snitzer <snitzer@redhat.com>
> >
> > Herbert, please feel free to pull this, and the next 6/6 patch, into
> > your crypto tree for 5.4.  I see no need to complicate matters by me
> > having to rebase my dm-5.4 branch ontop of the crypto tree, etc.
> >
> 
> Thanks Mike.
> 
> There is no need to rebase your branch - there is only a single
> dependency, which is the essiv template itself, and the patch that
> adds that (#1 in this series) was acked by Herbert, specifically so
> that it can be taken via another tree. The crypto tree has no
> interdependencies with this template, and the other patches in this
> series are not required for essiv in dm-crypt.

Ah ok, thanks for clarifying.

I just picked up patches 1, 5, and 6 and staged them in linux-next via
dm-5.4, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.4

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
