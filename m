Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4894E152
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 09:39:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E250581F19;
	Fri, 21 Jun 2019 07:39:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE9E601A5;
	Fri, 21 Jun 2019 07:39:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8F383F6E4;
	Fri, 21 Jun 2019 07:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5L7c6GC011611 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 03:38:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DB3218ADF; Fri, 21 Jun 2019 07:38:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4792D60477
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 07:38:01 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E7EC4E90E
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 07:37:42 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u13so344417iop.0
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eKu56qrR6ldaXAhpuMytqyaXBo7rKIWHf2u55/S5qlc=;
	b=ry3MGo6vj2UUu2k78C94AXspzrPTVv17EtBHPoknofeiZ/Orx2ftqk3BgPoZtzrySQ
	gPd8q6xevN0EQMJTG7oqVQ7vZG/3WYK6IB5su/Vv7tyWMvEPBT+NgIys0A/LUV8B+++3
	cUKfr8l/nLXxlV08YrRLzN1A20b6G2lWcJPM0uSAg6tahMRN2sDtXL8nHxDTUVmVMkKL
	q2WFuBW8unlJjgLsrlv7mXZcP7dLBCrk4QqA/C96H5hc1tWVTeSTGq6rYt9+tx2Sff+n
	xlxzWmkOzkkJp6wmK/S0yOno4cehwNim+KkdiP+z5fy6KebuhT0JgKWY66b+gku9pO15
	9njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eKu56qrR6ldaXAhpuMytqyaXBo7rKIWHf2u55/S5qlc=;
	b=fDicTyYjD8HpT1d88zCvH9+c8RwvmrOADPxxUeSJgnGL0EbQoI/wTWW+OyAVE7z4Ob
	pF4girEutMRpPKN+mW7lMUOQGhIZv6R/exAO9+W9xLWJYVHjlbmQ21HpJtUA5rqFnAYO
	PrxiW4/pqRHLa0dotqR/CVvEJwbyZVcqezi3mYAjPblcW7SfA1IvZfwK7GNkiwdIbqkc
	mF/jAlDpOWh4f3FCbeTh8y1q7mor/WfPKMFLxTqTS2GVfTtsb7v7PTuCfBCB2DOSDOxV
	EChBBk/Rv0Ax6naxVstgJ6hneRUHBGmScACjF/HxtoP2Mj4hgRoQrjQlvD6l8Zjznuxw
	YXkA==
X-Gm-Message-State: APjAAAUuMcOSB/ox8ELWyZDvDCqqenqocRegbFhrwpYFK4YX/OcWASHw
	ZSqhlrh9COcfhvDcKMcGFJOUDWI2pVnXN0eaqsthGzN2rLg=
X-Google-Smtp-Source: APXvYqxImupikNlO14TIwMpCXgLXbnvoAqX+dwe6kFb5GggQWUFSXCcCfyRIkJCDq/nFa68GIFuX+IltrNSfDTDZ3UE=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr23351565jar.2.1561102656600; 
	Fri, 21 Jun 2019 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
	<CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
	<075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
	<6a45dfa5-e383-d8a3-ebf1-abdc43c95ebd@gmail.com>
	<CAKv+Gu-ZETNJh2VzUkpbQUmYv6Zqb7nVj91bxuxKoNAJwgON=w@mail.gmail.com>
	<b635b78d-cfe8-3fa4-d9b2-6cf4185dac71@gmail.com>
	<CAKv+Gu-uRUFv1+yEqNdM1KpJSwic2oGF=CYPU6Sebf3eXwruMQ@mail.gmail.com>
In-Reply-To: <CAKv+Gu-uRUFv1+yEqNdM1KpJSwic2oGF=CYPU6Sebf3eXwruMQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 21 Jun 2019 09:37:25 +0200
Message-ID: <CAKv+Gu_aarbJ+UBjVP2eMEKekd_u-EPeAvuCwFVWfaO2uRhGUA@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 21 Jun 2019 07:37:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 21 Jun 2019 07:37:47 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
	ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 21 Jun 2019 07:39:31 +0000 (UTC)

On Fri, 21 Jun 2019 at 09:06, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Fri, 21 Jun 2019 at 09:01, Milan Broz <gmazyland@gmail.com> wrote:
> >
> > On 20/06/2019 15:52, Ard Biesheuvel wrote:
> > >>>> Does this include configurations that combine authenc with essiv?
> > >>>
> > >>> Hm, seems that we are missing these in luks2-integrity-test. I'll add them there.
> > >>>
> > >>> I also used this older test
> > >>> https://gitlab.com/omos/dm-crypt-test-scripts/blob/master/root/test_dmintegrity.sh
> > >>>
> > >>> (just aes-gcm-random need to be commented out, we never supported this format, it was
> > >>> written for some devel version)
> > >>>
> > >>> But seems ESSIV is there tested only without AEAD composition...
> > >>>
> > >>> So yes, this AEAD part need more testing.
> > >>
> > >> And unfortunately it does not work - it returns EIO on sectors where it should not be data corruption.
> > >>
> > >> I added few lines with length-preserving mode with ESSIV + AEAD, please could you run luks2-integrity-test
> > >> in cryptsetup upstream?
> > >>
> > >> This patch adds the tests:
> > >> https://gitlab.com/cryptsetup/cryptsetup/commit/4c74ff5e5ae328cb61b44bf99f98d08ffee3366a
> > >>
> > >> It is ok on mainline kernel, fails with the patchset:
> > >>
> > >> # ./luks2-integrity-test
> > >> [aes-cbc-essiv:sha256:hmac-sha256:128:512][FORMAT][ACTIVATE]sha256sum: /dev/mapper/dmi_test: Input/output error
> > >> [FAIL]
> > >>  Expecting ee501705a084cd0ab6f4a28014bcf62b8bfa3434de00b82743c50b3abf06232c got .
> > >>
> > >> FAILED backtrace:
> > >> 77 ./luks2-integrity-test
> > >> 112 intformat ./luks2-integrity-test
> > >> 127 main ./luks2-integrity-test
> > >>
> > >
> > > OK, I will investigate.
> > >
> > > I did my testing in a VM using a volume that was created using a
> > > distro kernel, and mounted and used it using a kernel with these
> > > changes applied.
> > >
> > > Likewise, if I take a working key.img and mode-test.img, i can mount
> > > it and use it on the system running these patches.
> > >
> > > I noticed that this test uses algif_skcipher not algif_aead when it
> > > formats the volume, and so I wonder if the way userland creates the
> > > image is affected by this?
> >
> > Not sure if I understand the question, but I do not think userspace even touch data area here
> > (except direct-io wiping after the format, but it does not read it back).
> >
> > It only encrypts keyslots - and here we cannot use AEAD (in fact it is already
> > authenticated by a LUKS digest).
> >
> > So if the data area uses AEAD (or composition of length-preserving mode and
> > some authentication tag like HMAC), we fallback to non-AEAD for keyslot encryption.
> >
> > In short, to test it, you need to activate device (that works ok with your patches)
> > and *access* the data, testing LUKS format and just keyslot access will never use AEAD.
> >
> > So init the data by direct-io writes, and try to read them back (with dd).
> >
> > For testing data on dm-integrity (or dm-crypt with AEAD encryption stacked oved dm-integrity)
> > I used small utility, maybe it could be useful https://github.com/mbroz/dm_int_tools
> >
>
> Thanks.
>
> It appears that my code generates the wrong authentication tags on
> encryption, but on decryption it works fine.
> I'll keep digging ...

OK, mystery solved.

The skcipher inside authenc() was corrupting the IV before the hmac
got a chance to read it.

I'll send out an updated version of the series.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
