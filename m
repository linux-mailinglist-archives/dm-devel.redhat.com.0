Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AD7F61B
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:40:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8488D30917EF;
	Fri,  2 Aug 2019 11:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E840260625;
	Fri,  2 Aug 2019 11:40:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C32341F53;
	Fri,  2 Aug 2019 11:40:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VJsW8X026745 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 15:54:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0715D19C65; Wed, 31 Jul 2019 19:54:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FA519C5B
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:54:31 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BCEDC0467C3
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:54:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15so50130188qkl.4
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BwTO9Eavd0UF8NNzgiLY/DTfzq+He1QSvlunSShZZCI=;
	b=jLVc2vbRk3FO+KAaEQZIQ2UqIQVz2YrnNxb2mnbtQpNU1UdNcTL+QjMRHT9olEvIRY
	WHV+rj6InrpOpVpvOk8KfTvl/kE5rT3c7JTzXJcZj8v4S9xawPucuTnXsF5JWcF01G4I
	JMSda063mpc77bVTJLRrerayMF1SO7gnmjDosmZCF6eoeocvD8byD7+SbVEv8aCACUtL
	nj+f3XQY/6xqXKnbicIUJ1hpO47OxKvawO5s2269ahK/xgt2nqCBQoPZp67896eYb6dZ
	BaL31sbM077lySAC8v9WvQHBZBmVkERJSrRZyDF7/t+1kW0v9zNEMM+R7Q7FCl6qpM78
	VX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BwTO9Eavd0UF8NNzgiLY/DTfzq+He1QSvlunSShZZCI=;
	b=NGiWwa+/cfACy2tNboYWeoyZj2wdFkfnfB6ILBMhu61JFzwbMfwX77RjdXO7h97zZE
	putU8Bi6VxP/gLQetYB9Rc3N+WTJSegxFhgKaVGuBzwwHPMsRhg32KNUfrveZU3H2toZ
	SqP/AzFS4ggUti8vkpvqZo+Yq4/0+2K1G41VXd412MmUtHVDlf3XtHzCB1u/03xxrw+p
	3omzxdAcO/k7Zu1ngbLxfj7vrvJYpvN40HOTpQQlOCQxFUHYJpF8iJRG6oOrYZVY8SMD
	84reWVcmowE8yt7Alywf6vlR8e63kFUayFVd/uaNvMeJFsWk2Kz3t0WhXY3LC/sn8f/8
	LsSA==
X-Gm-Message-State: APjAAAXwTpFJO+1wZADivrGCUYQQs3uKqLEDFzE/suEgyIRl/fXviIs9
	mIxbU/pVsHtR2Ef5Pz0eMTNVZMQj4PLh0y64uCw=
X-Google-Smtp-Source: APXvYqxFxYNaX0I5Vz7oxFiKHE2Lv102UKOj6S01zk3l81RVq6qguh3qpGIhPesMQEXEKTou9qHfCjoSzPkDTr8j7C0=
X-Received: by 2002:a37:4d82:: with SMTP id a124mr79464398qkb.72.1564602870746;
	Wed, 31 Jul 2019 12:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
	<6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
In-Reply-To: <6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 31 Jul 2019 12:54:19 -0700
Message-ID: <CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 31 Jul 2019 19:54:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 31 Jul 2019 19:54:31 +0000 (UTC) for IP:'209.85.222.194'
	DOMAIN:'mail-qk1-f194.google.com'
	HELO:'mail-qk1-f194.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.194 mail-qk1-f194.google.com 209.85.222.194
	mail-qk1-f194.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
	block device is gone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 02 Aug 2019 11:40:44 +0000 (UTC)

On Tue, Jul 30, 2019 at 5:31 AM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> On 29/07/2019 21:08, NeilBrown wrote:
> >[...]
> >> +    if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
> >> +            bio_io_error(bio);
> >> +            return BLK_QC_T_NONE;
> >> +    }
> >
> > I think this should only fail WRITE requests, not READ requests.
> >
> > Otherwise the patch is probably reasonable.
> >
> > NeilBrown
>
> Thanks for the feedback Neil! I thought about it; it seemed to me better
> to deny/fail the reads instead of returning "wrong" reads, since a file
> read in a raid0 will be incomplete if one member is missing.
> But it's fine for me to change that in the next iteration of this patch.

For reads at block/page level, we will either get EIO or valid data, right?

If that's not the case, we should fail all writes.

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
