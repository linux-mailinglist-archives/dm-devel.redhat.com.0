Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E460B894AF
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 00:24:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DC333024511;
	Sun, 11 Aug 2019 22:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C24A91001B17;
	Sun, 11 Aug 2019 22:24:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDECE2551B;
	Sun, 11 Aug 2019 22:24:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BMOIFb026325 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 18:24:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28E4B643FE; Sun, 11 Aug 2019 22:24:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2351F608C2
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 22:24:16 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A841C014166
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 22:24:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so28424594wru.10
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 15:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UXheENEMiRpgx2l6HkzAtHl2f0d7ytelj0WtAc62Ha0=;
	b=tVmQyDZrNXdTVWjioFWRR37q8KXJyu4G4B/cKGJGbM5UXmCDqTej1nhHdhd4QSg/yM
	TyZ0nWPvmnbaDndVMl4+VIYUqteUi3gOw0bhNqvkmOqEJUw6/NzyxBkORLNtlrhQYfrI
	Xkc96YRtmHgrutqsDI0Slqkc087opl3fb8Uy7MdhZP6Y99wW3Lx1qcEq53FChhsnGlCX
	Ma5/OtC01h3DFYC7lOQXc3NFerXKCvfIfWNiPwGCEiYkft9qk5guUHPQUGPpl1TjX6iR
	3nrue6UhtYzecY3emWdp2y333nNo59xTPVgXlSxHNQsX89LBYrtuzW6bYD4LZ8LvpMyZ
	w3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UXheENEMiRpgx2l6HkzAtHl2f0d7ytelj0WtAc62Ha0=;
	b=F4hsitgEUGJ47DufNKzPlpZRjTBw2MZXfFR1Cr2Yj1ixWOZs/tMS2H/5GMrCHKl9xv
	GYi1AGHPe9Q2RUwr8Kp6N1HjpnJyCIhaqT9uclh++PA3uSde74X7Kc/2zxmSVZib32RH
	ofOZ0Tx/rIy+SyIH6s7Z4p6M3H1DOudn8ZT2PpZFRAaLxLNSjZIlJMIYvlJZX4yC8X8s
	rPXWJ3DSZmiafzPGRHV2m6KI12Kpl+4vZj2Br/TyDxBGm5mdZT9rz8cfl+g/tDHJVbpi
	ups5hYvNbBGN/tQxITaI5Q7MFcKdIZ/xQ9ug+XsOcq+A24+eJwCuMjcJNapzX8ZmQuIK
	G/4A==
X-Gm-Message-State: APjAAAU2I9cmDvdc6sGrwzT65DBT27k014D3GilV2Rt1KOo+Mwo75IOn
	+MK7UDt3QTkneeOUvF4UZ1XjUQNAXTAiIF0R67PSng==
X-Google-Smtp-Source: APXvYqw6Ev3hyJ7dNxBOhgSeR7z4IWHGk/fD2e8yCKsFjFKifWc6y6YL3gfwufpYXQm0DsIx7JFuOE2tNkltBRWGEHU=
X-Received: by 2002:adf:aa09:: with SMTP id p9mr15199324wrd.174.1565562252915; 
	Sun, 11 Aug 2019 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
	<MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
	<MN2PR20MB2973A43F0995479489E583A7CAD00@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB2973A43F0995479489E583A7CAD00@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 12 Aug 2019 01:24:01 +0300
Message-ID: <CAKv+Gu8YEXBLqt32i=NPMd32Eq8Ui4POKzE4R14en=SNcGeYWw@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 11 Aug 2019 22:24:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sun, 11 Aug 2019 22:24:14 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sun, 11 Aug 2019 22:24:51 +0000 (UTC)

On Mon, 12 Aug 2019 at 00:15, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Sent: Saturday, August 10, 2019 6:40 AM
> > To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
> > Cc: Horia Geanta <horia.geanta@nxp.com>; Herbert Xu <herbert@gondor.apana.org.au>; Milan Broz
> > <gmazyland@gmail.com>; dm-devel@redhat.com; linux-crypto@vger.kernel.org
> > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> >
> > On Fri, 9 Aug 2019 at 23:57, Pascal Van Leeuwen
> > <pvanleeuwen@verimatrix.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > > Sent: Friday, August 9, 2019 7:49 PM
> > > > To: Horia Geanta <horia.geanta@nxp.com>
> > > > Cc: Herbert Xu <herbert@gondor.apana.org.au>; Pascal Van Leeuwen
> > > > <pvanleeuwen@verimatrix.com>; Milan Broz <gmazyland@gmail.com>; dm-devel@redhat.com;
> > linux-
> > > > crypto@vger.kernel.org
> > > > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> > > >
> > > > On Fri, 9 Aug 2019 at 10:44, Horia Geanta <horia.geanta@nxp.com> wrote:
> > > > >
> > > > > On 8/9/2019 9:45 AM, Ard Biesheuvel wrote:
> > > > > > On Fri, 9 Aug 2019 at 05:48, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> > > > > >>
> > > > > >> On Thu, Aug 08, 2019 at 06:01:49PM +0000, Horia Geanta wrote:
> > > > > >>>
> > > > > >>> -- >8 --
> > > > > >>>
> > > > > >>> Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for covering
> > > > > >>>  CTS (part II)
> > > > > >>
> > > > > >> Patchwork doesn't like it when you do this and it'll discard
> > > > > >> your patch.  To make it into patchwork you need to put the new
> > > > > >> Subject in the email headers.
> > > > > >>
> > > > > >
> > > > > > IMO, pretending that your XTS implementation is compliant by only
> > > > > I've never said that.
> > > > > Some parts are compliant, some are not.
> > > > >
> > > > > > providing test vectors with the last 8 bytes of IV cleared is not the
> > > > > > right fix for this issue. If you want to be compliant, you will need
> > > > > It's not a fix.
> > > > > It's adding test vectors which are not provided in the P1619 standard,
> > > > > where "data unit sequence number" is at most 5B.
> > > > >
> > > >
> > > > Indeed. But I would prefer not to limit ourselves to 5 bytes of sector
> > > > numbers in the test vectors. However, we should obviously not add test
> > > > vectors that are known to cause breakages on hardware that works fine
> > > > in practice.
> > > >
> > > Well, obviously, the full 16 byte sector number vectors fail on existing
> > > CAAM hardware, which I do assume to work fine in practice. And you know
> > > I'm not in favor of building all kinds of workarounds into the drivers.
> > >
> > > Fact is, we know there are no current users that need more than 64 bits
> > > of IV. Fact is also that having 64 bits of IV in the vectors is already
> > > an improvement over the 40 bits in the original vectors. And unlike CTS,
> > > I am not aware of any real use case for more than 64 bits.
> > > Finally, another fact is that limiting the *vectors* to 64 bits of IV
> > > does not prohibit anyone from *using* a full 128 bit IV on an
> > > implementation that *does* support this. I would think most users of
> > > XTS, like dmcrypt, would allow you to specify the cra_drivername
> > > explictly anyway, so just don't select legacy CAAM if you need that.
> > > (heck, if it would be reading and writing its own data, and not need
> > > compatibility with other implementations, it wouldn't even matter)
> > >
> > > So yes, the specs are quite clear on the sector number being a full
> > > 128 bits. But that doesn't prevent us from specifying that the
> > > crypto API implementation currently only supports 64 bits, with the
> > > remaining bits being forced to 0. We can always revisit that when
> > > an actual use case for more than 64 bits arises ...
> > >
> >
> > You have got it completely backwards:
> >
> > CTS has never worked in any kernel implementation, so regardless of
> > what the spec says, supporting it in the kernel is not a high priority
> > issue whichever way you put it.
> >
> I never said it was a high priority, I merely pointed out it's not spec
> compliant. Apparently, you feel that that's only important insofar that
> it matches current kernel use cases?
>
> Anyway, as far as I understand, there are no users that need more than
> 64 bits of IV in the kernel (i.e. dmcrypt uses only 64 bits), so I see
> no fundamental difference with CTS except that most(?) implementations
> possibly already "accidentally" (since unverified!) did it correctly.
>

Well, as Milan points out, dm-crypt may use the upper bits as well,
but the point I was making was about the userland interface. If you
care about spec compliance for the sake of it, I don't understand why
you dismiss a broken userland->kernel interface that silently fails
and corrupts your data as something we should just live with, and just
assume nobody will ever be silly enough to use it the way the spec
describes it, and use all the available IV bits.

> Not that I have any interest in restricting the IV size: "my" hardware
> handles full 128 bit IV's just fine. So why do I even bother ... :-)
>
> > Now is the first time anyone has asked
> > for it in 12 years, and only because someone spotted a deviation
> > between a h/w and a s/w implementation, not because anyone tried to
> > use it and failed. (Note that passing anything other than a multiple
> > of the block size will cause an error rather than fail silently)
> >
> Yes, failing silently is not such a good idea, I think we agree on that.
> Although we also need  to keep in mind that that's exactly what the CAAM
> driver has been doing all those years, and, before my vectors, nobody
> noticed or cared.

True. But now that the cat is out of the bag, we have an obligation to
our users to ensure that a known problem does not corrupt their data.

> Without my involvement, this would have probably gone
> unnoticed for many years to come (so I feel some responsibility ;-).
>
> > Truncated IVs are a huge issue, since we already expose the correct
> > API via AF_ALG (without any restrictions on how many of the IV bits
> > are populated), and apparently, if your AF_ALG request for xts(aes)
> > happens to be fulfilled by the CAAM driver and your implementation
> > uses more than 64 bits for the IV, the top bits get truncated silently
> > and your data might get eaten.
> >
> Apparently, not such a "huge" issue at all, see previous remark.
>
> As a precaution, the CAAM driver could return -EINVAL if the upper IV
> bytes are non-zero.

Then we'd still have two implementations that behave differently, and
this is not how abstractions work. If a driver implements xts(aes),
then it should produce the same output (and return value) for every
input.

> But then testmgr would have to do less strict error
> return code checking so we don't force this upon drivers that CAN do it.
>
> Implementing a full SW fallback for that in the driver just seems like
> massive overkill, as you normally specify the driver for dmcrypt explictly
> anyway (or at least, you can do that if the default fails).
>

How would you find out if the default fails? Either it corrupts your
data, or it fails with an error that is specific to CAAM, and so we
would have to update the dm-crypt code to deal with en/decryption
failures that can only occur in this particular case. This is
*exactly* the thing I argued against before, when we discussed zero
length inputs: the reason we want the workaround in the driver is
because it is contained, and its peculiarities don't leak into other
layers.

> I don't like the idea of HW drivers doing SW fallbacks because it clouds
> the whole picture of what is actually done by a certain HW device.
>

Well, the reality is that we OS guys get to clean up after the h/w
guys all the time. I agree that explicit failure is better than silent
corruption, but that still means there are corner cases where things
just don't work. So the only acceptable way to me is to fix this with
a s/w workaround, and as I already pointed out, this could simply be
the xts template wrapped around the accelerated ECB implementation
exposed by the driver.


> > In my experience, users tend to care more about the latter than the former.
> >
> >
> > > > > > to provide a s/w fallback for these cases.
> > > > > >
> > > > > Yes, the plan is to:
> > > > >
> > > > > -add 16B IV support for caam versions supporting it - caam Era 9+,
> > > > > currently deployed in lx2160a and ls108a
> > > > >
> > > > > -remove current 8B IV support and add s/w fallback for affected caam versions
> > > > > I'd assume this could be done dynamically, i.e. depending on IV provided
> > > > > in the crypto request to use either the caam engine or s/w fallback.
> > > > >
> > > >
> > > > Yes. If the IV received from the caller has bytes 8..15 cleared, you
> > > > use the limited XTS h/w implementation, otherwise you fall back to
> > > > xts(ecb-aes-caam..).
> > >
> > > Regards,
> > > Pascal van Leeuwen
> > > Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
> > > www.insidesecure.com
> > >
>
> Regards,
> Pascal van Leeuwen
> Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
> www.insidesecure.com
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
