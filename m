Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2753B24872C
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559--yTbxCzeN_2-jnZDqK9IWA-1; Tue, 18 Aug 2020 10:17:46 -0400
X-MC-Unique: -yTbxCzeN_2-jnZDqK9IWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8684F81F021;
	Tue, 18 Aug 2020 14:17:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 651E45C70C;
	Tue, 18 Aug 2020 14:17:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F438181A06D;
	Tue, 18 Aug 2020 14:17:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HLkRaP013922 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 17:46:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09A3C2166BB3; Mon, 17 Aug 2020 21:46:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 044202166BCC
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 21:46:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D97628040AD
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 21:46:24 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-9PLHFdYNMk-n1xmLE5YEDQ-1; Mon, 17 Aug 2020 17:46:20 -0400
X-MC-Unique: 9PLHFdYNMk-n1xmLE5YEDQ-1
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07HLX9GQ181310; Mon, 17 Aug 2020 17:46:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32yy8em1ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Aug 2020 17:46:19 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HLa99C193944;
	Mon, 17 Aug 2020 17:46:18 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.108])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32yy8em1uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Aug 2020 17:46:18 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07HLirNW009324; Mon, 17 Aug 2020 21:46:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma05fra.de.ibm.com with ESMTP id 32x7b81mmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Aug 2020 21:46:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07HLkEWL29294974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 17 Aug 2020 21:46:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1419A405C;
	Mon, 17 Aug 2020 21:46:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DC68A405B;
	Mon, 17 Aug 2020 21:46:11 +0000 (GMT)
Received: from sig-9-65-192-88.ibm.com (unknown [9.65.192.88])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 17 Aug 2020 21:46:10 +0000 (GMT)
Message-ID: <5f12cc89c535ccfc6c3d63efa2bf716a1fdd966d.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>, agk@redhat.com,
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 17 Aug 2020 17:46:08 -0400
In-Reply-To: <20200816210250.11506-1-tusharsu@linux.microsoft.com>
References: <20200816210250.11506-1-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-17_15:2020-08-17,
	2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	lowpriorityscore=0
	clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0
	mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008170146
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: sashal@kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 0/2] dm-devel:dm-crypt: infrastructure for
 measurement of DM target data using IMA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 14:02 -0700, Tushar Sugandhi wrote:
> There are several device-mapper targets which contribute to verify
> the integrity of the mapped devices e.g. dm-integrity, dm-verity,
> dm-crypt etc.
> 
> But they do not use the capabilities provided by kernel integrity
> subsystem (IMA). For instance, the IMA capability that measures several
> in-memory constructs and files to detect if they have been accidentally
> or maliciously altered, both remotely and locally. IMA also has the
> capability to include these measurements in the IMA measurement list and
> use them to extend a TPM PCR so that it can be quoted.

"both remotely" refers to measurement and attestation, while "locally"
refers to integrity enforcement, based on hashes or signatures.  Is
this patch set adding both IMA-measurement and IMA-appraisal?

Mimi

>  These TPM PCR
> extend operations ensure that the tampering with the order of constructs
> being measured, and tampering with the measured constructs themselves -
> doesn't go undetected. In general, this capability is used for remote
> attestation of in-memory constructs and files of interest. As of today,
> device-mapper targets don't use the benefits of extended TPM PCR
> quotes and ultimately the benefits of remote attestation.
> 
> This series bridges this gap, so that all device-mapper targets
> could take advantage of IMA's measuring and quoting abilities - thus
> ultimately enabling remote attestation for device-mapper targets.
> 
> This series is based on the following repo/branch:
>  repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
>  branch: next-integrity
>  commit 3db0d0c276a7 ("integrity: remove redundant initialization of variable ret")
> 
> This series also has a dependency on the following patch series and
> should be applied in the following order:
>  1. https://patchwork.kernel.org/patch/11709527/
>  2. https://patchwork.kernel.org/patch/11711249/
>  3. https://patchwork.kernel.org/patch/11712729/
> 
> Tushar Sugandhi (2):
>   dm-devel: collect target data and submit to IMA to measure
>   dm-crypt: collect data and submit to DM to measure
> 
>  drivers/md/Makefile            |   1 +
>  drivers/md/dm-crypt.c          | 170 +++++++++++++++++++
>  drivers/md/dm-ima.c            | 296 +++++++++++++++++++++++++++++++++
>  include/linux/device-mapper.h  |  58 +++++++
>  security/integrity/ima/Kconfig |   2 +-
>  5 files changed, 526 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/md/dm-ima.c
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

