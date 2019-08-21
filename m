Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F697949
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 14:30:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FC7719562B7;
	Wed, 21 Aug 2019 12:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE471001B09;
	Wed, 21 Aug 2019 12:30:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51E2A180124D;
	Wed, 21 Aug 2019 12:30:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7L6gRlB025585 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 02:42:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1697381A5; Wed, 21 Aug 2019 06:42:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D686D50DD6
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 06:42:24 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E2F33082A98
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 06:42:23 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
	20190821064221epoutp0188d7cfca1d580e5f6d688eed7cfd45f7~83PskuwMD0941709417epoutp01W
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 06:42:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
	20190821064221epoutp0188d7cfca1d580e5f6d688eed7cfd45f7~83PskuwMD0941709417epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1566369741;
	bh=XmvgRUmAe2wKYHiaDqlBZGz349t74yQ9imYtStg6lHE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=EyrZTewcBbnxZ2ulz/otdpewDqEruz8Gud79PDG0yCy8/AeusfGxfVhKuVwJt8Pf2
	SL0wiJqUSv0zYKfIsddwCagVIWTGRUImgR1K7TCBBnotK2s1AZAsg81SMgoJvNXp56
	Rjxco0dg2OmIqVhl3gJ8bwZ39Vh4YGf39hZWq8v0=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20190821064221epcas2p2684e6115ac12d837c9b5307f2df57c40~83PsF4bp_1369213692epcas2p2c;
	Wed, 21 Aug 2019 06:42:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
	epsnrtp5.localdomain (Postfix) with ESMTP id 46Cykz5DwgzMqYkn;
	Wed, 21 Aug 2019 06:42:19 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	2B.23.04068.BC7EC5D5; Wed, 21 Aug 2019 15:42:19 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20190821064219epcas2p28b42391923012ecc7875313b8b2b9a1a~83PqdlOeq1149811498epcas2p2u;
	Wed, 21 Aug 2019 06:42:19 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20190821064219epsmtrp298889ca36b32f346ee40f3eadb0b6908~83PqcX4JK2201622016epsmtrp2V;
	Wed, 21 Aug 2019 06:42:19 +0000 (GMT)
X-AuditID: b6c32a47-5a1ff70000000fe4-6f-5d5ce7cb27a6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F8.D2.03638.BC7EC5D5; Wed, 21 Aug 2019 15:42:19 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20190821064218epsmtip16b10bb697269b2ad72f00b6d9cd76543~83Pp9CBw40460704607epsmtip1E;
	Wed, 21 Aug 2019 06:42:18 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Jaehoon Chung'" <jh80.chung@samsung.com>, "'Ulf Hansson'"
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Date: Wed, 21 Aug 2019 15:42:18 +0900
Message-ID: <003f01d557eb$94210260$bc630720$@samsung.com>
MIME-Version: 1.0
Thread-Index: AdVX6DWbOAXQrOkmQ/qY5VJQXNywng==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjN7fvRh6PyrIzdNZuWN1kCBmxhxUsHc3FmvmT+wVy2JU6GL/DS
	MtrXrq9luCwTN9YhNmNkuthSicGpWx1BW4bEUX9UBlPsKiOgJXVkk8xIFRWQBHFuLQ8z/jv3
	fOfk+8798lGY0i1XUVWCnbcJnIkhl+FdF7LX5w7c3F6mOdGfgx7MNOCo41Ifho5fbyLRwP6w
	DHkj9TgKTrYQqL3nEYb2TjyHxjs8GLr20EmgphtxDEUiJ+TIf2OEQMHRtWjsjzkZcrfGSPR7
	22Y00TqLo57gRRwNnfaSqPffJoAORM7IkPPkA4C+cM3JUX/7u68+y3b+EJWx9YGP2K5zWexQ
	2MH6fXtINjbSQ7KB73axPx+alrGfXf4FY++eGSbZrzp9gJ32rypN3WYqNvJcJW9T80KFpbJK
	MJQwb7xV/lq5rlCjzdUWofWMWuDMfAmzaUtp7utVpkR2Rl3DmRwJqpQTRWbdK8U2i8POq40W
	0V7C8NZKk1WrteaJnFl0CIa8CotZr9Vo8nUJ5Q6Tsfl8vdx6O6PWN3MEqwNeZSNIoSD9Erx0
	9STRCJZRSrobwCOueVJ6TAF4/Nv7WFKlpGcBPDf84RNH29m4TOKDALonVkmGWwD2heeJZIGk
	18JAvw8kcTrtThSaPkiKMPqxHI5PhfBkYSWth1dibQsYp7Pg/c/H5EmsoIvgwZFBQsIr4EX3
	+IIGo1fDU3e8mDSFGnaH44sN8mDz+SAmadJhyx4nlmwG6d0U7P2+G5cMm2B09h6Q8Eo40d8p
	l7AKTk8GSQnvgsNHD8slswvAyw+di6IC6Pn7y4SZSnTIhh2n1yUhpF+AvaOLsy2HDRf+kUu0
	AjY4F793DTw4NSSTaBW85/pUolkYntyPfw0yPUtCepaE9CwJ4/m/7SGA+0AGbxXNBl7MtxYs
	3bUfLJxFzuZu0PXblhCgKcCkKnZcfa9MSXA14k5zCEAKY9IVtd5tZUpFJbfzY95mKbc5TLwY
	ArrEDpox1dMVlsSRCfZyrS6/sFBTpEO6wnzEPKPwPxXdrqQNnJ2v5nkrb3vik1EpqjqgXR4t
	1g8W11UTb26cTOF3Z1+7XVc7emUsPHBzQx/oPHbnr2/2nk0THvXNv5xx3RlYcTj64ttVKWPu
	A60hB7obmM/8aV+avjHeG/x1aPUooTf8KPsk8/Gt9ngGZ3w+q+ao1jVY/U5sw/stM+z0xups
	wb8m7U+d/pQxYoRzdCx1awGDi0ZOm4PZRO4/ucmGcSwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7bCSnO7p5zGxBi97eC2+fulgsVh/6hiz
	xeq7/WwWp6eeZbKYc76FxWLvu9msFmv3/GG26H4lY/Fk/Sxmixu/2lgt+h+/ZrY4f34Du8Wm
	x9dYLfbe0ra4f+8nk8XMeXfYLC4tcrd4Ne8bi8WevSdZLC7vmsNmceR/P6PFjPP7mCzaNn5l
	tGjt+clucXxtuIOkx5aVN5k8WjaXe2w7oOpx+Wypx6ZVnWwed67tYfPYvKTeY/eCz0weTWeO
	Mnu833eVzaNvyypGj8+b5AJ4orhsUlJzMstSi/TtErgyJh5sYS94I1ax6stS5gbGOUJdjJwc
	EgImEov2v2bqYuTiEBLYzSgxtfEKC0RCSmJr+x5mCFtY4n7LEVYQW0jgOaPEt8+FIDabgLbE
	5uOrGEGaRQRmM0r8vfCcESTBLDCNQ2LXB3EQW1jASuLCnUVgQ1kEVCU+Nt9nB7F5BSwl5l67
	yAphC0qcnPkEqIYDqFdPom0j1Bh5ie1v50DdoCCx4+xrsLgIUMnEg3uZIWpEJGZ3tjFPYBSc
	hWTSLIRJs5BMmoWkYwEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjOAkoKW1g/HE
	ifhDjAIcjEo8vDtuRscKsSaWFVfmHmKU4GBWEuGtmBMVK8SbklhZlVqUH19UmpNafIhRmoNF
	SZxXPv9YpJBAemJJanZqakFqEUyWiYNTqoGR49ZSiUbF4w+XLgwVlV/2UZDZY92+iayFwY3L
	v+bcvnBgy2Hj5/d9cuZvKKx9knfhhufxzt3XzL7IF394pJ4V8+Ps/nRuD8UXam99dwm7buxL
	uOYx4ca6B/I1HAd3lohFZ95rkbgtb7yv68NNbfbzSq7Td97fa2Biz3mj8+X0jvWFobp6Nx96
	K7EUZyQaajEXFScCAOfGz5v+AgAA
X-CMS-MailID: 20190821064219epcas2p28b42391923012ecc7875313b8b2b9a1a
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821064219epcas2p28b42391923012ecc7875313b8b2b9a1a
References: <CGME20190821064219epcas2p28b42391923012ecc7875313b8b2b9a1a@epcas2p2.samsung.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Wed, 21 Aug 2019 06:42:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 21 Aug 2019 06:42:23 +0000 (UTC) for IP:'203.254.224.24'
	DOMAIN:'mailout1.samsung.com' HELO:'mailout1.samsung.com'
	FROM:'boojin.kim@samsung.com' RCPT:''
X-RedHat-Spam-Score: -5.103  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	SPF_PASS) 203.254.224.24 mailout1.samsung.com 203.254.224.24
	mailout1.samsung.com <boojin.kim@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 21 Aug 2019 08:29:57 -0400
Cc: 'Ulf
	Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
	dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
	'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	'Herbert Xu' <herbert@gondor.apana.org.au>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Kukjin Kim' <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	'Chao Yu' <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	'Jens Axboe' <axboe@kernel.dk>, 'Theodore Ts'o' <tytso@mit.edu>,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"'David S. Miller'" <davem@davemloft.net>
Subject: [dm-devel] [PATCH 3/9] mmc: dw_mmc: support crypto operation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Wed, 21 Aug 2019 12:30:08 +0000 (UTC)

This patch supports the crypto operation in mmc driver.
Two vops are added to dw_mci_drv_data for it.
The crypto_engine_cfg() is required to set crypto information such as
key and algorithm modes before I/O.
The crypto_engine_clear() is required to clear the crypto information
set in the H/W after I/O.

Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 drivers/mmc/host/dw_mmc.c | 22 +++++++++++++++++++++-
 drivers/mmc/host/dw_mmc.h |  6 ++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index eea52e2..0cdf574 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -470,6 +470,7 @@ static void dw_mci_dmac_complete_dma(void *arg)
 {
 	struct dw_mci *host = arg;
 	struct mmc_data *data = host->data;
+	const struct dw_mci_drv_data *drv_data = host->drv_data;
 
 	dev_vdbg(host->dev, "DMA complete\n");
 
@@ -481,6 +482,9 @@ static void dw_mci_dmac_complete_dma(void *arg)
 				    data->sg_len,
 				    DMA_FROM_DEVICE);
 
+	if (drv_data && drv_data->crypto_engine_clear)
+		drv_data->crypto_engine_clear(host, host->sg_cpu, false);
+
 	host->dma_ops->cleanup(host);
 
 	/*
@@ -577,8 +581,10 @@ static inline int dw_mci_prepare_desc64(struct dw_mci
*host,
 {
 	unsigned int desc_len;
 	struct idmac_desc_64addr *desc_first, *desc_last, *desc;
+	int i, ret;
+	const struct dw_mci_drv_data *drv_data = host->drv_data;
+	int sector_offset = 0;
 	u32 val;
-	int i;
 
 	desc_first = desc_last = desc = host->sg_cpu;
 
@@ -618,6 +624,20 @@ static inline int dw_mci_prepare_desc64(struct dw_mci
*host,
 			desc->des4 = mem_addr & 0xffffffff;
 			desc->des5 = mem_addr >> 32;
 
+			if (drv_data && drv_data->crypto_engine_cfg) {
+				ret = drv_data->crypto_engine_cfg(host,
desc,
+						data, sg_page(&data->sg[i]),
i,
+						sector_offset, false);
+				if (ret) {
+					dev_err(host->dev,
+						"%s: fail to set
crypto(%d)\n",
+						__func__, ret);
+					return -EPERM;
+				}
+				/* mmc sector size */
+				sector_offset += desc_len / 512;
+			}
+
 			/* Update physical address for the next desc */
 			mem_addr += desc_len;
 
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index da5923a..b32d39b 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -563,5 +563,11 @@ struct dw_mci_drv_data {
 						struct mmc_ios *ios);
 	int		(*switch_voltage)(struct mmc_host *mmc,
 					  struct mmc_ios *ios);
+	int		(*crypto_engine_cfg)(struct dw_mci *host, void
*desc,
+				struct mmc_data *data, struct page *page,
+				int page_offset, int sector_offset,
+				bool cmdq_enabled);
+	int		(*crypto_engine_clear)(struct dw_mci *host,
+				void *desc, bool cmdq_enabled);
 };
 #endif /* _DW_MMC_H_ */
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
