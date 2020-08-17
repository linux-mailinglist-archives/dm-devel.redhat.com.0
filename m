Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 91DA6248719
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:17:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-vKgg7yq_PlClI6XwrCLKtQ-1; Tue, 18 Aug 2020 10:17:29 -0400
X-MC-Unique: vKgg7yq_PlClI6XwrCLKtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E041A1006708;
	Tue, 18 Aug 2020 14:17:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0007A1EE;
	Tue, 18 Aug 2020 14:17:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80A6E6036D;
	Tue, 18 Aug 2020 14:17:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HKhIcT005574 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 16:43:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EFD52022789; Mon, 17 Aug 2020 20:43:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DB992017E9B
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 20:43:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 098C2101A56E
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 20:43:16 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-529-VlixautGPEaXnENuXh1csA-1; Mon, 17 Aug 2020 16:43:13 -0400
X-MC-Unique: VlixautGPEaXnENuXh1csA-1
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07HKgVtO185816
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 16:43:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32y4f4aj5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 16:43:12 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HKh8sb189640
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 16:43:12 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32y4f4aj4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Aug 2020 16:43:11 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07HKfCro008572; Mon, 17 Aug 2020 20:43:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 32x7b82mt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 17 Aug 2020 20:43:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07HKfceR62390554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 17 Aug 2020 20:41:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09143A4059;
	Mon, 17 Aug 2020 20:43:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87B87A4040;
	Mon, 17 Aug 2020 20:43:03 +0000 (GMT)
Received: from sig-9-65-192-88.ibm.com (unknown [9.65.192.88])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 17 Aug 2020 20:43:03 +0000 (GMT)
Message-ID: <591b5f09c7df8ef0378866eaf3afde7a7cb4e82f.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, gmazyland@gmail.com
Date: Mon, 17 Aug 2020 16:43:02 -0400
In-Reply-To: <20200812193102.18636-3-tusharsu@linux.microsoft.com>
References: <20200812193102.18636-1-tusharsu@linux.microsoft.com>
	<20200812193102.18636-3-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-17_14:2020-08-17,
	2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 suspectscore=3
	clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0
	mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008170136
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/3] IMA: add policy to support measuring
 critical data from kernel components
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-12 at 12:31 -0700, Tushar Sugandhi wrote:
> There would be several candidate kernel components suitable for IMA
> measurement. Not all of them would be enlightened for IMA measurement.
> Also, system administrators may not want to measure data for all of
> them, even when they are enlightened for IMA measurements. An IMA policy
> specific to various kernel components is needed to measure their
> respective critical data.
> 
> Add a new IMA policy CRITICAL_DATA+data_sources to support measuring
> various critical kernel components. This policy would enable the
> system administrators to limit the measurement to the components,
> if the components are enlightened for IMA measurement.

"enlightened", really?  Please find a different term, maybe something
like "supported".

Before posting a patch set, please look at the patches line by line,
like anyone reviewing the code needs to do.  Please minimize code
change.   Unnecessary formatting changes are unacceptible.   For
example, like the "#define", below, or in 3/3 the
"process_buffer_measurement()" change from void to int.

scripts/Lindent isn't as prevalent as it used to be, but it's still
included in Documentation/process/coding-style.rst.  Use it as a guide.

Mimi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

