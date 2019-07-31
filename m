Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0417F618
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:40:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A44DF30832E1;
	Fri,  2 Aug 2019 11:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D3D55C205;
	Fri,  2 Aug 2019 11:40:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B70811800205;
	Fri,  2 Aug 2019 11:40:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VJmBkG025970 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 15:48:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BC5E5C205; Wed, 31 Jul 2019 19:48:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9587D5C1B5
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:48:09 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DEC583F45
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:48:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h18so67783855qtm.9
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 12:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r4ThdQGVBATX5UW51gPtaZR8VaZdoaqY85bZCDNitnU=;
	b=cqKSaJnUU6IyUb7AVNz0kGQRw48j8UF9qqD/afuBGcjSXsHVzpD1MM6GXMFcTNyJHK
	68CugZ2jVNvnBWIXz5Ey8iCf8NFBFDJwbRxvnY4FaMngooIkHbMWapbQj29wbturlceT
	nXQb9P8ApdCU0wnxs6u6x1Ooi02mHjNdcnVKJZPSsdxpVoV2dqhToNuqf5Ie/AdzwmAw
	vx4HR1MF4y5/kxXVmQLanG7A+6XGAHnHitSnSmJ6mvNwBCrYd+gqZn7g3mNTl9er6R0n
	eSEzsvmARLWbm3rrX81yP6DZerKZc8BEVu4HcMc4kPQxt/4o6BT8SlwEuXPM3wcCxAgQ
	6aJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r4ThdQGVBATX5UW51gPtaZR8VaZdoaqY85bZCDNitnU=;
	b=nhJ4Q96COwM+AqVcJQR/UKCEhPZk05cJsXHuZ4+nbvvQtuI/6b1unQDVLzDrWkRBs+
	oDTJj6MaBTiRlW89RiGKwTNC6EG2Qc5P2UW7wNPKipsWj/0Eppl5eJxOxipWD+a+x/Mr
	14slHTK7h2v9z+6DSA6uxGf0lrSBgxLQIg/VlejggubSHstyzMAp4LjRhqUbrU4DCWvW
	aNOVPTuwzLo2sIyU2/EDkYO5LvUXaNEHsOJb6XSNZoG6taaSmTQihHgsWbkbpDG3PDbU
	f95Df5LEcf8fFVCdv9okXXmlMib2duhInoZL5n1IDF3NMbOHJkdxN4l0h/OpCaOPob7u
	4CPQ==
X-Gm-Message-State: APjAAAVYFud8ldN2fbSedVHCeMYWsbH+h3XF/0lgVIZLYRvxHg0jOwV0
	ZAvpKl5ewplDeDYLE8VI+s9XjCVIp7QZJMTL6oM=
X-Google-Smtp-Source: APXvYqwun7y8X5PX4twGro6+r4qzgqvWKHZsH1GiyxzF3Cp2J87Q7dbt9/bUPE9AjFE3UGCHOgIrSPFmoEfKpsOO9g4=
X-Received: by 2002:ac8:25e7:: with SMTP id f36mr87184016qtf.139.1564602486802;
	Wed, 31 Jul 2019 12:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
	<87ftmnkpxi.fsf@notabene.neil.brown.name>
	<9dd836f8-7358-834f-8d29-cd0db717d01b@canonical.com>
In-Reply-To: <9dd836f8-7358-834f-8d29-cd0db717d01b@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 31 Jul 2019 12:47:55 -0700
Message-ID: <CAPhsuW5cAS6mR4PGnzOsuhU8Grs2yN=e5mF4A9+zDQ9DGn9pGw@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 31 Jul 2019 19:48:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 31 Jul 2019 19:48:07 +0000 (UTC) for IP:'209.85.160.196'
	DOMAIN:'mail-qt1-f196.google.com'
	HELO:'mail-qt1-f196.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.153  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.196 mail-qt1-f196.google.com 209.85.160.196
	mail-qt1-f196.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <songliubraving@fb.com>,
	dm-devel@redhat.com, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	Bob Liu <bob.liu@oracle.com>, linux-block@vger.kernel.org,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH 1/2] md/raid0: Introduce new array state
	'broken' for raid0
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 02 Aug 2019 11:40:22 +0000 (UTC)

On Wed, Jul 31, 2019 at 6:05 AM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> On 30/07/2019 21:28, NeilBrown wrote:
> > On Tue, Jul 30 2019, Bob Liu wrote:
> >>
> >>
> >> Curious why only raid0 has this issue?
> >
> > Actually, it isn't only raid0.  'linear' has the same issue.
> > Probably the fix for raid0 should be applied to linear too.
> >
> > NeilBrown
> >
>
> Thanks Neil, it makes sense! I didn't considered "linear" and indeed,
> after some testing, it reacts exactly as raid0/stripping.
>
> In case this patch gets good acceptance I can certainly include
> md/linear in that!
> Cheers,

This looks good. Please include Neil's feedback in v2.

Btw, there is no 2/2 in this set, right?

Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
