Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA181659CD
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3aUJLcqpYFlZenlCwnXOeiWzrDOGe9ySHinGoajZVBc=;
	b=cV+Jhi3yNo6d8aDyAPaANxjWZeDC1m2jgJvGzDduZ4io3JTXuA34VX+TcpMoLAhT12Frbi
	YB7/I6ifwZjjwyYnuB0RiHsXxbPSobYXjJCCnlmAXnu8mSBYBs1xy5H/SQoc9pz9K6HHns
	RPiMtIdkdxsMbhwtFxbzVkwQG7Fwr6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-2e9yebQZPuGYIuGUOzO_Fg-1; Thu, 20 Feb 2020 04:06:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43FF81007275;
	Thu, 20 Feb 2020 09:06:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 177B35DA7B;
	Thu, 20 Feb 2020 09:06:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90F611803C40;
	Thu, 20 Feb 2020 09:06:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D5L5DD007279 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 00:21:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 370EC2093CFC; Thu, 13 Feb 2020 05:21:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CAE2031A4C
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 05:21:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC3978EC760
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 05:21:02 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-xwtDHjS7M3-3hNtPFfmFDA-1; Thu, 13 Feb 2020 00:21:00 -0500
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id
	20200213051134epoutp047f544957ef1d0866c10a10c20d7b2203~y3irlYwvd1532615326epoutp04s
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 05:11:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
	20200213051134epoutp047f544957ef1d0866c10a10c20d7b2203~y3irlYwvd1532615326epoutp04s
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20200213051134epcas5p42726869588349c499b8c3da045a165d0~y3irDD3OG2644726447epcas5p4e;
	Thu, 13 Feb 2020 05:11:34 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	31.DF.19629.68AD44E5; Thu, 13 Feb 2020 14:11:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20200213051133epcas5p1da9cdfd3276be99b7a6cad8ec05393d9~y3iqGyF6q2731627316epcas5p1G;
	Thu, 13 Feb 2020 05:11:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200213051133epsmtrp2ddcf86fe0bc32abb8d8f1f4e86dcca0d~y3iqFrcAi2721027210epsmtrp2k;
	Thu, 13 Feb 2020 05:11:33 +0000 (GMT)
X-AuditID: b6c32a4b-32dff70000014cad-f0-5e44da86608a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.CD.10238.58AD44E5; Thu, 13 Feb 2020 14:11:33 +0900 (KST)
Received: from joshik02 (unknown [107.111.93.135]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20200213051130epsmtip2e44f26578a9cf2d1ffa37ac049172c9c~y3inF-sfn1334813348epsmtip2Z;
	Thu, 13 Feb 2020 05:11:30 +0000 (GMT)
From: <joshi.k@samsung.com>
To: "'Chaitanya Kulkarni'" <Chaitanya.Kulkarni@wdc.com>,
	<linux-block@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <dm-devel@redhat.com>,
	<lsf-pc@lists.linux-foundation.org>
In-Reply-To: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
Date: Thu, 13 Feb 2020 10:41:28 +0530
Message-ID: <00d001d5e22c$0ebf63c0$2c3e2b40$@samsung.com>
MIME-Version: 1.0
Thread-Index: AQIQ/CJV9ObV4J6sH2oJT57LwF4MMQFeJX7Op5dpB3A=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTURjGOffe3V3FxXVavimEjb40sqIPTl9aFHTCoP6MKG3UbUa61m5m
	ZpFRyLQsWxm6IstKUWnVjPUxZ7ZaEs0wbWlTI0vT1L5mRWpmbtfA/37veZ7nnPeBw9HKcjac
	26XdJ+i16mQVG8hYH0fNnJPlWZMwr6sxBFe0nWbx+W8DNDa19DLY/uWCDH+wjFC4qthI4bIK
	J4Wzn9dT2DnymcVGx2uE7Z7ZuKikU45PNN1jcXWvncaltX8pnJf1k8ZnDG4KvzD9YXHFH4zL
	PlK433VJhnseJqycRBpfxZNjl1sZ0liXSizl2SypvHaEnG0uRcT2JpMlBd4fLGly3aXI904P
	Q6ztuXJivfpJRr5Wu1ly6k45IpXPM0i/ZcrG4M2By3cIybv2C/q5sdsCkzzuW3JdOzlgbpyW
	ib7G5qAADviF8N3Vw+agQE7J2xB4znympMGLwGWy0tLwC0FNbgf1P2I9/UgmCXYEObmVY64u
	NKpUyXwulo+AfHefXwjlmxHcMNT4L6b5HzSY866wPlcAvxXyhzyjAseF8OugrWiy75jhp0Pb
	8RHkYwW/BN6f/S2XOBieFXYwPqb5GGjOP8dKPBtKrvTS0nqRYPM6/UuE8kvhVdFNWvKEwSfn
	E7lvB+Cvc1DYN8JIgTUw4HgslzgEemrvjHE49H+xsxKLMNjqpKWwAUFTZuFYOA5eVg1T0gsT
	IHeow18GeAUYspSSZSq8NXbKJA6D9oJrY0yg1XyVykNTTeO6mcZ1M43rZhrX4TJiytFkQSem
	aARxkW6BVkiLEdUpYqpWE7N9T4oF+X9wdPw9ZHmx3oF4DqmCFDXdqxOUMvV+MT3FgYCjVaGK
	sKOjR4od6vSDgn5Poj41WRAdKIJjVGEKo8y9Rclr1PuE3YKgE/T/VYoLCM9Em5UrEhtWrTT/
	XLbJFo2+tdTXNV1sn6GLu8EMcprDh2y19d61Fwue0Ycj0xZH1rSUWuY+yTkYcju6u8z8LmhS
	1AMxIbJ7oZEbKOnS15+kVEEN2tBi3YbqTRavIf6XM3/i3vvJ6UMZDW+H408IH2bMcu08p6lO
	fLg3OOlpQV0xlRalYsQk9fxoWi+q/wFVqumPvQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZdlhJXrf1lkucQc8JAYvVd/vZLKZ9+Mls
	Mev2axaLve9ms1o83vSfyWLPoklMFitXH2Wy6Dx9gcni6P+3bBaTDl1jtNh7S9ti/rKn7Bbd
	13ewWex7vZfZYvnxf0wWE9q+MltM7LjKZHFu1h82i9V/LCxWPmOy+HxmHqvFq/1xDmIel694
	ezQvuMPicflsqcemVZ1sHpuX1HtMvrGc0WP3zQY2jxmfvrB5XD+zncnj49NbLB7bHvaye2xb
	/JLV4/2+q2wefVtWMXpsPl3t8XmTXIBgFJdNSmpOZllqkb5dAlfGu8YvjAVfXCo+zZnD1sDY
	b9XFyMkhIWAisa3/IGsXIxeHkMBuRolLz98yQyTEJZqv/WCHsIUlVv57zg5R9JRRYk5TDwtI
	gk1AWmLq1TfMIAkRgTuMEntObQerYhboYJHYu2kCM0TLOkaJm2v3M4K0cArESkz9fYupi5GD
	Q1jAU+LufEmQMIuAqsTdlv9gJbwClhKPJkOs5hUQlDg58wnYNmYBA4n7hzpYIWxtiWULX0Od
	qiCx+9NRsLiIgJXElfnrmSFqxCVeHj3CPoFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucW
	GxYY5qWW6xUn5haX5qXrJefnbmIEpxEtzR2Ml5fEH2IU4GBU4uGVfO0cJ8SaWFZcmXuIUYKD
	WUmEV7wRKMSbklhZlVqUH19UmpNafIhRmoNFSZz3ad6xSCGB9MSS1OzU1ILUIpgsEwenVANj
	dtZNV+usnonP1pzzj83wXpDVNOOP8WXN5G+q92Xrfte+D14hb7ohpn1dHL/H3tc1p9JW/fIX
	7ebZod4wcWnuyubrwkyPrXuOuy99HmxZeOKzI8PX04wz94ZrWFhPaYyPur3LJ3FZW6+zUKLF
	nqvr/2/T0T4TrT5lxcr+nEWrfudff7PysHyIEktxRqKhFnNRcSIASXR7jB8DAAA=
X-CMS-MailID: 20200213051133epcas5p1da9cdfd3276be99b7a6cad8ec05393d9
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20200107181551epcas5p4f47eeafd807c28a26b4024245c4e00ab
References: <CGME20200107181551epcas5p4f47eeafd807c28a26b4024245c4e00ab@epcas5p4.samsung.com>
	<BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
X-MC-Unique: xwtDHjS7M3-3hNtPFfmFDA-1
X-MC-Unique: 2e9yebQZPuGYIuGUOzO_Fg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D5L5DD007279
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: axboe@kernel.dk, frederick.knight@netapp.com, msnitzer@redhat.com,
	bvanassche@acm.org, "'Martin
	K. Petersen'" <martin.petersen@oracle.com>, javier@javigon.com,
	'Stephen Bates' <sbates@raithlin.com>, roland@purestorage.com,
	'Keith Busch' <kbusch@kernel.org>, mpatocka@redhat.com,
	joshi.k@samsung.com, rwheeler@redhat.com, 'Christoph	Hellwig' <hch@lst.de>,
	'Matias Bjorling' <Matias.Bjorling@wdc.com>, zach.brown@ni.com
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I am very keen on this topic.
I've been doing some work for "NVMe simple copy", and would like to discuss
and solicit opinion of community on the following:

- Simple-copy, unlike XCOPY and P2P, is limited to copy within a single
namespace. Some of the problems that original XCOPY work [2] faced may not
be applicable for simple-copy, e.g. split of single copy due to differing
device-specific limits.
Hope I'm not missing something in thinking so?

- [Block I/O] Async interface (through io-uring or AIO) so that multiple
copy operations can be queued.

- [File I/O to user-space] I think it may make sense to extend
copy_file_range API to do in-device copy as well.

- [F2FS] GC of F2FS may leverage the interface. Currently it uses
page-cache, which is fair. But, for relatively cold/warm data (if that need=
s
to be garbage-collected anyway), it can rather bypass the Host and skip
running into a scenario when something (useful) gets thrown out of cache.

- [ZNS] ZNS users (kernel or user-space) would be log-structured, and will
benefit from internal copy. But failure scenarios (partial copy,
write-pointer position) need to be discussed.

Thanks,
Kanchan

> -----Original Message-----
> From: linux-nvme [mailto:linux-nvme-bounces@lists.infradead.org] On Behal=
f
> Of Chaitanya Kulkarni
> Sent: Tuesday, January 7, 2020 11:44 PM
> To: linux-block@vger.kernel.org; linux-scsi@vger.kernel.org; linux-
> nvme@lists.infradead.org; dm-devel@redhat.com; lsf-pc@lists.linux-
> foundation.org
> Cc: axboe@kernel.dk; msnitzer@redhat.com; bvanassche@acm.org; Martin K.
> Petersen <martin.petersen@oracle.com>; Matias Bjorling
> <Matias.Bjorling@wdc.com>; Stephen Bates <sbates@raithlin.com>;
> roland@purestorage.com; mpatocka@redhat.com; hare@suse.de; Keith Busch
> <kbusch@kernel.org>; rwheeler@redhat.com; Christoph Hellwig <hch@lst.de>;
> frederick.knight@netapp.com; zach.brown@ni.com
> Subject: [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy Offload
>=20
> Hi all,
>=20
> * Background :-
> -----------------------------------------------------------------------
>=20
> Copy offload is a feature that allows file-systems or storage devices to
be
> instructed to copy files/logical blocks without requiring involvement of
the local
> CPU.
>=20
> With reference to the RISC-V summit keynote [1] single threaded
performance is
> limiting due to Denard scaling and multi-threaded performance is slowing
down
> due Moore's law limitations. With the rise of SNIA Computation Technical
> Storage Working Group (TWG) [2], offloading computations to the device or
> over the fabrics is becoming popular as there are several solutions
available [2].
> One of the common operation which is popular in the kernel and is not
merged
> yet is Copy offload over the fabrics or on to the device.
>=20
> * Problem :-
> -----------------------------------------------------------------------
>=20
> The original work which is done by Martin is present here [3]. The latest
work
> which is posted by Mikulas [4] is not merged yet. These two approaches ar=
e
> totally different from each other. Several storage vendors discourage
mixing
> copy offload requests with regular READ/WRITE I/O. Also, the fact that th=
e
> operation fails if a copy request ever needs to be split as it traverses
the stack it
> has the unfortunate side-effect of preventing copy offload from working i=
n
> pretty much every common deployment configuration out there.
>=20
> * Current state of the work :-
> -----------------------------------------------------------------------
>=20
> With [3] being hard to handle arbitrary DM/MD stacking without splitting
the
> command in two, one for copying IN and one for copying OUT. Which is then
> demonstrated by the [4] why [3] it is not a suitable candidate. Also, wit=
h
[4]
> there is an unresolved problem with the two-command approach about how to
> handle changes to the DM layout between an IN and OUT operations.
>=20
> * Why Linux Kernel Storage System needs Copy Offload support now ?
> -----------------------------------------------------------------------
>=20
> With the rise of the SNIA Computational Storage TWG and solutions [2],
existing
> SCSI XCopy support in the protocol, recent advancement in the Linux Kerne=
l
File
> System for Zoned devices (Zonefs [5]), Peer to Peer DMA support in the
Linux
> Kernel mainly for NVMe devices [7] and eventually NVMe Devices and
subsystem
> (NVMe PCIe/NVMeOF) will benefit from Copy offload operation.
>=20
> With this background we have significant number of use-cases which are
strong
> candidates waiting for outstanding Linux Kernel Block Layer Copy Offload
> support, so that Linux Kernel Storage subsystem can to address previously
> mentioned problems [1] and allow efficient offloading of the data related
> operations. (Such as move/copy etc.)
>=20
> For reference following is the list of the use-cases/candidates waiting
for Copy
> Offload support :-
>=20
> 1. SCSI-attached storage arrays.
> 2. Stacking drivers supporting XCopy DM/MD.
> 3. Computational Storage solutions.
> 7. File systems :- Local, NFS and Zonefs.
> 4. Block devices :- Distributed, local, and Zoned devices.
> 5. Peer to Peer DMA support solutions.
> 6. Potentially NVMe subsystem both NVMe PCIe and NVMeOF.
>=20
> * What we will discuss in the proposed session ?
> -----------------------------------------------------------------------
>=20
> I'd like to propose a session to go over this topic to understand :-
>=20
> 1. What are the blockers for Copy Offload implementation ?
> 2. Discussion about having a file system interface.
> 3. Discussion about having right system call for user-space.
> 4. What is the right way to move this work forward ?
> 5. How can we help to contribute and move this work forward ?
>=20
> * Required Participants :-
> -----------------------------------------------------------------------
>=20
> I'd like to invite block layer, device drivers and file system developers
to:-
>=20
> 1. Share their opinion on the topic.
> 2. Share their experience and any other issues with [4].
> 3. Uncover additional details that are missing from this proposal.
>=20
> Required attendees :-
>=20
> Martin K. Petersen
> Jens Axboe
> Christoph Hellwig
> Bart Van Assche
> Stephen Bates
> Zach Brown
> Roland Dreier
> Ric Wheeler
> Trond Myklebust
> Mike Snitzer
> Keith Busch
> Sagi Grimberg
> Hannes Reinecke
> Frederick Knight
> Mikulas Patocka
> Matias Bj=F8rling
>=20
> [1]https://protect2.fireeye.com/url?k=3D22656b2d-7fb63293-2264e062-
> 0cc47a31ba82-2308b42828f59271&u=3Dhttps://content.riscv.org/wp-
> content/uploads/2018/12/A-New-Golden-Age-for-Computer-Architecture-
> History-Challenges-and-Opportunities-David-Patterson-.pdf
> [2] https://protect2.fireeye.com/url?k=3D44e3336c-19306ad2-44e2b823-
> 0cc47a31ba82-70c015d1b0aaeb3f&u=3Dhttps://www.snia.org/computational
> https://protect2.fireeye.com/url?k=3Da366c2dc-feb59b62-a3674993-
> 0cc47a31ba82-
> 20bc672ec82b62b3&u=3Dhttps://www.napatech.com/support/resources/solution
> -descriptions/napatech-smartnic-solution-for-hardware-offload/
>       https://protect2.fireeye.com/url?k=3D90febdca-cd2de474-90ff3685-
> 0cc47a31ba82-
> 277b6b09d36e6567&u=3Dhttps://www.eideticom.com/products.html
> https://protect2.fireeye.com/url?k=3D4195e835-1c46b18b-4194637a-
> 0cc47a31ba82-
> a11a4c2e4f0d8a58&u=3Dhttps://www.xilinx.com/applications/data-
> center/computational-storage.html
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/mkp/linux.git xcopy [4]
> https://protect2.fireeye.com/url?k=3D455ff23c-188cab82-455e7973-
> 0cc47a31ba82-e8e6695611f4cc1f&u=3Dhttps://www.spinics.net/lists/linux-
> block/msg00599.html
> [5] https://lwn.net/Articles/793585/
> [6] https://protect2.fireeye.com/url?k=3D08eb17f6-55384e48-08ea9cb9-
> 0cc47a31ba82-1b80cd012aa4f6a3&u=3Dhttps://nvmexpress.org/new-nvmetm-
> specification-defines-zoned-
> namespaces-zns-as-go-to-industry-technology/
> [7] https://protect2.fireeye.com/url?k=3D54b372ee-09602b50-54b2f9a1-
> 0cc47a31ba82-ea67c60915bfd63b&u=3Dhttps://github.com/sbates130272/linux-
> p2pmem
> [8] https://protect2.fireeye.com/url?k=3D30c2303c-6d116982-30c3bb73-
> 0cc47a31ba82-95f0ddc1afe635fe&u=3Dhttps://kernel.dk/io_uring.pdf
>=20
> Regards,
> Chaitanya
>=20
> _______________________________________________
> linux-nvme mailing list
> linux-nvme@lists.infradead.org
> https://protect2.fireeye.com/url?k=3Dd145dc5a-8c9685e4-d1445715-
> 0cc47a31ba82-
> 3bf90c648f67ccdd&u=3Dhttp://lists.infradead.org/mailman/listinfo/linux-nv=
me




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

