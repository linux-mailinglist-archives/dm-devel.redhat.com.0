Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E909358D12
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 23:31:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F58A85A04;
	Thu, 27 Jun 2019 21:31:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC901001B23;
	Thu, 27 Jun 2019 21:31:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7DC51806B1B;
	Thu, 27 Jun 2019 21:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PGUsvf013675 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 12:30:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B577B5C261; Tue, 25 Jun 2019 16:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9E345C25D
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 16:30:50 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B73CD30860AA
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 16:30:40 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w13so28034037eds.4
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 09:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=javigon-com.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=kR0WUI8Wb/oooTRRXaBppmKY4itrnwNoAnfaDYxWCXg=;
	b=Ef0Cu/REsmQg6MhTc0LYNFTuhGc/eYuhkoJy1MGD6n5TmP+cKrBx8wz8DHzN4qWA/w
	vZojz0AdcMfxpwZJ7hgKiQr/hzQhMIThIwtXks+4SynHn8cJdogvib5h19034NVKrMAI
	NjWd6xGzFc6MXM3hEvtByGou96H6k5pVi1RhgmUhXkvtUZTn8bireeiH0H5rmKaFfm32
	I/VKCt/kPCSqGu1d2+flXrxMsqpEUghbeMhl4KnWUHVtkf6ud8zMVi9wgsEEysTlyCjC
	jFfLAlDGpF7w1EyEsVC3njvZ7t9cUm8tcMvbOeiJOsDj8kUUmzeT+QI4FDBlt4BZ3PQZ
	8iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=kR0WUI8Wb/oooTRRXaBppmKY4itrnwNoAnfaDYxWCXg=;
	b=thjVDNBwX3Xa9Gpap6dVAWseR9vVhJ2QfY8eTI4tfj+ixfa3yldNk0WCMQAJQ//Phm
	/dYytk073odkQG1q+nOgc4ouzTaKMgbVnRaNFDUrzZTCOebS9oIoVa1IXFYHHWFPphe1
	kZAeo8m7x6++v7Wge4tfQJr+69PLOMDwFqtc3Ra4wUkV9OQeo2ZhHfqBOkV4OoTXyXiM
	zZcqMobPQh81wenfEggO9397BZkOKY47/beeVxetMlATeF9dEDf8fpttpYE5MfJbPIMG
	TwlcnRsSVP4e2X5sPc4LaPnHQIen5hBHK3u01LNhcnr+7x1P1mCmu4lZ8+WAIOuUGdU6
	gggg==
X-Gm-Message-State: APjAAAVUI+57tuHV5MjedNaVJB5m42hvSsoiOUP0ro+coCprJ7xkyfU6
	Y+rvHSAay+D6tPPz76Wgjt/p5w==
X-Google-Smtp-Source: APXvYqyj3S0faUmz2N4ooIsNesYDYB3kQPdxuPc/QEDIXsVTGkCor1MNCYdGo1SZ2+JpaeL+DTMdng==
X-Received: by 2002:a17:906:487:: with SMTP id
	f7mr15597256eja.236.1561480239429; 
	Tue, 25 Jun 2019 09:30:39 -0700 (PDT)
Received: from [192.168.1.119] (ip-5-186-122-168.cgn.fibianet.dk.
	[5.186.122.168])
	by smtp.gmail.com with ESMTPSA id f3sm2477238ejo.90.2019.06.25.09.30.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 09:30:38 -0700 (PDT)
From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier@javigon.com>
Message-Id: <798FDD1F-415C-43CD-AC8E-3BEB08FD3AE4@javigon.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Tue, 25 Jun 2019 18:30:37 +0200
In-Reply-To: <79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
To: Bart Van Assche <bvanassche@acm.org>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
	<79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 25 Jun 2019 16:30:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 25 Jun 2019 16:30:41 +0000 (UTC) for IP:'209.85.208.65'
	DOMAIN:'mail-ed1-f65.google.com' HELO:'mail-ed1-f65.google.com'
	FROM:'javier@javigon.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.65 mail-ed1-f65.google.com 209.85.208.65
	mail-ed1-f65.google.com <javier@javigon.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Jun 2019 17:29:46 -0400
Cc: "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jens Axboe <axboe@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	=?utf-8?Q?Matias_Bj=C3=B8rling?= <mb@lightnvm.io>,
	Christoph Hellwig <hch@lst.de>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Type: multipart/mixed; boundary="===============7118138699137174658=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 27 Jun 2019 21:31:38 +0000 (UTC)


--===============7118138699137174658==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_05ED6925-114F-4BB9-8D0F-85B181FB037A";
	protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_05ED6925-114F-4BB9-8D0F-85B181FB037A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

> On 25 Jun 2019, at 17.55, Bart Van Assche <bvanassche@acm.org> wrote:
>=20
> On 6/25/19 3:35 AM, Matias Bj=C3=B8rling wrote:
>> On 6/25/19 12:27 AM, Chaitanya Kulkarni wrote:
>>> On 6/24/19 12:43 PM, Bart Van Assche wrote:
>>>> static inline bool op_is_write(unsigned int op)
>>>> {
>>>>     return (op & 1);
>>>> }
>> The zone mgmt commands are neither write nor reads commands. I guess, =
one could characterize them as write commands, but they don't write any =
data, they update a state of a zone on a drive. One should keep it as =
is? and make sure the zone mgmt commands don't get categorized as either =
read/write.
>=20
> Since the open, close and finish operations support modifying zone =
data I propose to characterize these as write commands. How about the =
following additional changes:
> - Make bio_check_ro() refuse open/close/flush/reset zone operations =
for read-only partitions (see also commit a32e236eb93e ("Partially =
revert "block: fail op_is_write() requests to read-only partitions"") # =
v4.18).
> - In submit_bio(), change op_is_write(bio_op(bio)) ? "WRITE" : "READ" =
into something that uses blk_op_str().
> - Add open/close/flush zone support be added in blk_partition_remap().
>=20
> Thanks,
>=20
> Bart.

Agreed. This is also what we do with REQ_OP_DISCARD and it makes things
easier in the driver.

Apart from the return comment from Damien and Minwoo, the patch looks =
good to me.

Reviewed-by: Javier Gonz=C3=A1lez <javier@javigon.com>


--Apple-Mail=_05ED6925-114F-4BB9-8D0F-85B181FB037A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEU1dMZpvMIkj0jATvPEYBfS0leOAFAl0STC0ACgkQPEYBfS0l
eODeeg/8CeCql8ROfdygJuY5YBknnNtJ3MBG0pVnbVyzvejjnzJUDMmAPd6dkXe+
CqFiJ2qBtgcqQawrGwUpwG+Z3a2lq0ts9KjDEh3XWDbERplM1i9kq89xAO8E8pLU
J0zyzYyLMzp3v2Ht+UKhH37Ml2CcfUX5+fpwcF7GhNiVi03Z+g/MhA7uyZ3p52lC
9tFNmpPGHP818kqFZIZu+TrfCDQFeiUu6F+ve8X3BowxS9dzwbiTYteBKny1cBZ5
1whAbzLbStIbcKZs7An6/DCDebppZkC7HAf7ZJw4yobWOqUF2sTO3+UouYpuHNob
WPpX1+bh84AyLGVp04c2G6iNBEYfDQMRovCJ8BMOTebmRuDk7OQmldNMbGDgLhGd
ap/hGkASIUe43bFY1kVeVwAKIms8zUMBAJxHuhhQ1DErRLBEHBVtYTqQlHhX3b/L
Z3Tcldt3h+tMBjiDSh1yZ6ZREIJ0aWU6V4uTFSZjpxD7p2NA8p/2zmS3tNjAiZZ4
Ng0ENcfOPtmunqXKw1sUk7Zc5LWD8ybX3EKfU2iLfN/+N2DFl+q5w5WhKQOmBscb
DdWJglfESr6FnesiiuR3a2fhm24LlhEmNmAcE9cu6UHFcWsoIef18q+1OOdQZp5h
UGgljTYKj1Esl9iHL6/F/MPFIcpKbyFexxhY8EFlXfUO3/Amgrg=
=xyg2
-----END PGP SIGNATURE-----

--Apple-Mail=_05ED6925-114F-4BB9-8D0F-85B181FB037A--


--===============7118138699137174658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7118138699137174658==--

