Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F65B67F
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 10:13:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 958C02F8BDB;
	Mon,  1 Jul 2019 08:13:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5CCE53C34;
	Mon,  1 Jul 2019 08:13:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2FA97206D3;
	Mon,  1 Jul 2019 08:13:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SCsH9f025554 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 08:54:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39C0760C64; Fri, 28 Jun 2019 12:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E4960BEC;
	Fri, 28 Jun 2019 12:54:12 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
	[210.118.77.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E89553082B02;
	Fri, 28 Jun 2019 12:54:08 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
	20190628125405euoutp017585b9f9397f3152d7945eb8a635792c~sXe2ay7hQ3247532475euoutp01E;
	Fri, 28 Jun 2019 12:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
	20190628125405euoutp017585b9f9397f3152d7945eb8a635792c~sXe2ay7hQ3247532475euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1561726445;
	bh=qzxIRvVGx/3VyHnGbR9j5H6ALGHkn1ZSDXlE5FAdkwI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=ADzWQAhWUQ+KOYVTlCHl+rTDW1I7O0wa+1i03JfoOum+541/Fg80mGMRbZaq9WzRS
	Vx636CdlmOCjtahPKbaaJa+7C9d4mvxObv2wRPluDMrmNC0mfmQwXj6RmcaIdgDzLw
	zgy8jD9s28ngU4LtDmxfsbSWD542++qrS/c1xkYQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20190628125405eucas1p19d9de132c7c507269bd5260f8650ca2c~sXe12_QGn2787027870eucas1p10;
	Fri, 28 Jun 2019 12:54:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 9A.C4.04298.CED061D5;
	Fri, 28 Jun 2019 13:54:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20190628125404eucas1p2da9a38ced35daa959456b0d0f244d7a2~sXe08o7rC0406704067eucas1p2z;
	Fri, 28 Jun 2019 12:54:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20190628125404eusmtrp20e45f3155f71e3978c0ccf59fde6c45a~sXe0tyTrQ0425604256eusmtrp29;
	Fri, 28 Jun 2019 12:54:04 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-af-5d160dec4e13
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 4C.93.04140.BED061D5;
	Fri, 28 Jun 2019 13:54:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20190628125402eusmtip2b672e4f40a25f69d3c8db9a125b40c5c~sXezJFTjm0418304183eusmtip2w;
	Fri, 28 Jun 2019 12:54:02 +0000 (GMT)
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <be37b10b-81e1-8258-e149-a27942e98173@samsung.com>
Date: Fri, 28 Jun 2019 14:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7ee0e33575633f689203f582259c2cbdce477176.1561724493.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxTHfXpfaSi7FqTPfNliDSZKgBnMcjadm2Zud5lLFreYRe1YHXdo
	pEhaYVO/kOEoghQpirFUBCG8yWgppLwoCUEttmZIARXqtNOi2dwqXbGZyITR3pDx7XfO+T05
	//PhYQl5CbOcPZB1WNBmqTOVtJS0O6ZvJf0li1e9VWV/B+rctxmwuBwE6J/VMzAXuIzgldHB
	wKX7pTRMWWdpmOjTI6iZfkmB+dZxErzBewh6n1VSMBqapCG/1kJD8dOVUNGmgLZSFnweLwPV
	p/QM2Hx3KOj1JIL3wbQEagrqSCh46EFwwxCgYKTHTIO+0IzgkWtIAo5LozSY/z1NwB8NNQj6
	z/QimAyekECX6yIBw33VEsi/No6g2m5AUNAWQpDnbKSg3XaGgNN9ZSS8sPoo8Bp7JR8k8v/8
	ZCD5kTtugp95aUR868kmiq9qOcZ3NI1L+ID9IeK7TfcZPvD317y9L4GvMLpo3n6vi+DbG9fz
	I7/k8LbmEzQ/WBkgP39jt3RzupB5IFfQpmz5RrrfU/VZtnP1D62GSioPuXERimIxtxE//tFC
	FCEpK+caEfZ52hixeI5wZaGVDFtybgrhntGPFl40THWSotSA8Lg/RIuFH+GW8jEqbMVyO/G0
	oZ4Icxz3NnYOXo9IBFcSjc8ZRpnwgObexWX6ZhRmGbcF5110RZjkEnCJbyziLOO+wl6HlRKd
	pdh5biISKYpT45ba8xGH4BTYM3FBIvKbuNNvJsSowSg8d1kl8oe4znKTFDkWPx3oYEReiee6
	w2+l89yK8KvC3wmx6ES4oXyWFq1N+OqAez4FO79hHbb0pIjtrXgmUEyG25iLwWP+pWKGGGy0
	nyXEtgwXFshFey221lvphbVF3U3EKaQ0LbrMtOga06JrTP/vrUZkM1IIOTpNhqDbkCV8n6xT
	a3Q5WRnJ3x7S2ND8J7k5OxDsQqHhff2IY5EyWvYiOl4lp9S5uiOafoRZQhkne30wTiWXpauP
	HBW0h9K0OZmCrh+tYEmlQnZsyW975FyG+rBwUBCyBe3CVMJGLc9DpXefFH9yctZ29L3Vrgdz
	M6FtqyoUf6peg9xVyVL/ryh2q7tiaFfoxoTgtHxRtm/Xxu3fpW7ae/tC6qfBj6loz5d3Q8uW
	aDYnBScnj6ddX+sM/Tyz4qxJI82VxhgPduxIeX/78/g99uHQtr2pLbsfX0m6Eps9tOaJv7Ym
	rTxx3aP0hPx2Janbr96wntDq1P8BW8Xj/CAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SX0xTZxiH851/Lcxux4ryjZipNWQZxkIL2BfXkSW7ORebW3QXZhPdCZwA
	G21dT8vmnKMTR2sdVRjqLB226hAQRVAraJpg43CtwoYg0RppXHFT2aCD4KwDGbRZwt2T/J7n
	4k1eKSl3M2nSUr1JMOr5MgWTTF1/fm147ahsWUHW9a+1cKL/lgTagj0kWMcaJTAbvYxgprZH
	Aqfu7Wdg8uxzBka6rQg8sWc0uH7ZQ0F44i4C31g9DYNT4wxUHm9jYN/j5XCoPRXa90shEgpL
	wH3AKoGOyBANvtAaCA/HCPBUnaCg6n4Iwc+OKA0Dl1wMWG0uBL8FfyWg59QgA67pOhIenfQg
	8B/0IRif2EtAZ/AYCTe73QRUXr2DwO11IKhqn0JgCTTRcK7jIAl13TUUPD0boSFc6yPeXMP9
	842D4gaG+knu32e1iDvzbTPNNbTu5M433yG4qPc+4rqc9yRc9O+tnLc7nTtUG2Q4791OkjvX
	lMEN9Jq5jpa9DNdXH6Xee+UDpdZoMJuElSUG0fSG4kMVqJWqPFCqc/KUqmxNwXp1riIzX1sk
	lJWWC8bM/I+UJaGGd7YHVn1+xlFPW1A/tqMkKWZz8MnJi5QdJUvl7I8I93qihB1J54bl+Fpb
	ecJZgqeH7EzCGUV4ZjKM5ocl7EYcczSS85zCrsOBvp/iEsnWLMKePyuJRPEQ4T+qL8cLhl2P
	a6wtcZax+dhyLBhnik3H1ZHbknleym7GN8abqISzGAeOjMQ5ieVx6/Ef4g7JvoqnG26SCU7F
	oZGjRIJX4It/ucgDSO5ckDsXJM4FiXNB4kZUC0oRzKKuWCeqlSKvE836YmWhQdeB5r7T2xM7
	34nsY5v8iJUixSKZO3lZgZzmy8UdOj/CUlKRInu5L6VALivid3whGA3bjOYyQfSj3Lnjasi0
	pYWGuV/Xm7apclUayFNpsjXZ60CRKrOxV7bI2WLeJHwiCNsF4/8dIU1Ks6A940erA7df+LLC
	3/J4w7u3KqD0Qeh0ZMsR34Wn+fzVreizqV1Xvl+RseElC/NkKLgylGXjWh/oJxa/1be6d5UJ
	5Xw14LHNxpJGX9NGbxxGzbt279zXZftdNqh6Upel70r7+HWNOtD0qfvS7HeFD9/Xvpja7glm
	zpwu3N34dnpR1qPhCgUllvCqDNIo8v8Bq/m1rrMDAAA=
X-CMS-MailID: 20190628125404eucas1p2da9a38ced35daa959456b0d0f244d7a2
X-Msg-Generator: CA
X-RootMTR: 20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
	<CGME20190628123124epcas2p3edc3c3a64edf324948a9ec1f9e41b974@epcas2p3.samsung.com>
	<7ee0e33575633f689203f582259c2cbdce477176.1561724493.git.mchehab+samsung@kernel.org>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Fri, 28 Jun 2019 12:54:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 28 Jun 2019 12:54:10 +0000 (UTC) for IP:'210.118.77.11'
	DOMAIN:'mailout1.w1.samsung.com' HELO:'mailout1.w1.samsung.com'
	FROM:'b.zolnierkie@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 210.118.77.11 mailout1.w1.samsung.com 210.118.77.11
	mailout1.w1.samsung.com <b.zolnierkie@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jul 2019 04:11:25 -0400
Cc: Thomas, Rich Felker <dalias@libc.org>, Mike Snitzer <snitzer@redhat.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Richard Russon \(FlatCap\)" <ldm@flatcap.org>, Ksenija,
	Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, linux-efi@vger.kernel.org,
	Willy Tarreau <willy@haproxy.com>,
	"H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>, Mauro, linux-rtc@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stanojevic <ksenija.stanojevic@gmail.com>,
	Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
	Helge Deller <deller@gmx.de>, x86@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
	Jonathan, Bergmann <arnd@arndb.de>,
	Chehab <mchehab@infradead.org>, linux-block@vger.kernel.org,
	Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org,
	Matt Mackall <mpm@selenic.com>, Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	linux-ntfs-dev@lists.sourceforge.net,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Martin Mares <mj@ucw.cz>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Arnd,
	linux-video@atrey.karlin.mff.cuni.cz, Alexandre
Subject: Re: [dm-devel] [PATCH 28/39] docs: admin-guide: add a series of
 orphaned documents
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 01 Jul 2019 08:13:49 +0000 (UTC)


On 6/28/19 2:30 PM, Mauro Carvalho Chehab wrote:
> There are lots of documents that belong to the admin-guide but
> are on random places (most under Documentation root dir).
> 
> Move them to the admin guide.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> ---
>  Documentation/ABI/stable/sysfs-devices-node     |  2 +-
>  Documentation/ABI/testing/procfs-diskstats      |  2 +-
>  Documentation/ABI/testing/sysfs-block           |  2 +-
>  .../ABI/testing/sysfs-devices-system-cpu        |  4 ++--
>  .../{btmrvl.txt => admin-guide/btmrvl.rst}      |  0
>  .../clearing-warn-once.rst}                     |  0
>  .../{cpu-load.txt => admin-guide/cpu-load.rst}  |  0
>  .../cputopology.rst}                            |  0
>  .../admin-guide/device-mapper/statistics.rst    |  4 ++--
>  .../{efi-stub.txt => admin-guide/efi-stub.rst}  |  0
>  .../{highuid.txt => admin-guide/highuid.rst}    |  0
>  Documentation/admin-guide/hw-vuln/l1tf.rst      |  2 +-
>  .../hw_random.rst}                              |  0
>  Documentation/admin-guide/index.rst             | 17 +++++++++++++++++
>  .../{iostats.txt => admin-guide/iostats.rst}    |  0
>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>  .../kernel-per-CPU-kthreads.rst}                |  0
>  .../lcd-panel-cgram.rst                         |  2 --
>  Documentation/{ldm.txt => admin-guide/ldm.rst}  |  0
>  .../lockup-watchdogs.rst}                       |  0
>  .../mm/cma_debugfs.rst}                         |  2 --
>  Documentation/admin-guide/mm/index.rst          |  1 +
>  .../{numastat.txt => admin-guide/numastat.rst}  |  0
>  Documentation/{pnp.txt => admin-guide/pnp.rst}  |  0
>  Documentation/{rtc.txt => admin-guide/rtc.rst}  |  0
>  .../{svga.txt => admin-guide/svga.rst}          |  0
>  Documentation/admin-guide/sysctl/kernel.rst     |  2 +-
>  .../video-output.rst}                           |  0
>  Documentation/fb/vesafb.rst                     |  2 +-
>  Documentation/x86/topology.rst                  |  2 +-
>  MAINTAINERS                                     | 12 ++++++------
>  arch/arm/Kconfig                                |  2 +-
>  arch/parisc/Kconfig                             |  2 +-
>  arch/sh/Kconfig                                 |  2 +-
>  arch/sparc/Kconfig                              |  2 +-
>  arch/x86/Kconfig                                |  4 ++--
>  block/partitions/Kconfig                        |  2 +-
>  drivers/char/Kconfig                            |  4 ++--
>  drivers/char/hw_random/core.c                   |  2 +-
>  include/linux/hw_random.h                       |  2 +-
>  40 files changed, 47 insertions(+), 33 deletions(-)
>  rename Documentation/{btmrvl.txt => admin-guide/btmrvl.rst} (100%)
>  rename Documentation/{clearing-warn-once.txt => admin-guide/clearing-warn-once.rst} (100%)
>  rename Documentation/{cpu-load.txt => admin-guide/cpu-load.rst} (100%)
>  rename Documentation/{cputopology.txt => admin-guide/cputopology.rst} (100%)
>  rename Documentation/{efi-stub.txt => admin-guide/efi-stub.rst} (100%)
>  rename Documentation/{highuid.txt => admin-guide/highuid.rst} (100%)
>  rename Documentation/{hw_random.txt => admin-guide/hw_random.rst} (100%)
>  rename Documentation/{iostats.txt => admin-guide/iostats.rst} (100%)
>  rename Documentation/{kernel-per-CPU-kthreads.txt => admin-guide/kernel-per-CPU-kthreads.rst} (100%)
>  rename Documentation/{auxdisplay => admin-guide}/lcd-panel-cgram.rst (99%)
>  rename Documentation/{ldm.txt => admin-guide/ldm.rst} (100%)
>  rename Documentation/{lockup-watchdogs.txt => admin-guide/lockup-watchdogs.rst} (100%)
>  rename Documentation/{cma/debugfs.rst => admin-guide/mm/cma_debugfs.rst} (98%)
>  rename Documentation/{numastat.txt => admin-guide/numastat.rst} (100%)
>  rename Documentation/{pnp.txt => admin-guide/pnp.rst} (100%)
>  rename Documentation/{rtc.txt => admin-guide/rtc.rst} (100%)
>  rename Documentation/{svga.txt => admin-guide/svga.rst} (100%)
>  rename Documentation/{video-output.txt => admin-guide/video-output.rst} (100%)
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
