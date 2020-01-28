Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0649B14B4CF
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jan 2020 14:23:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580217792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=akXiU/o3Oqfo62VknCuNh7Mj/P8ImOZMLSVjKVx4rmo=;
	b=ZvnJt0gXuEXyf+nNe9e+WqRQIE5XO87Qu8tZWPTvre2G7u8x/582ESmVv9Vlhj2oGwWh+Z
	cYxaKTLqJeVPncQGgz22LtvrRFMriuwtrcHjKamddXb9xuw0iF0tmv1bJbEOTu0JdJ8MK6
	OPul4TRDoaNzuFLMOi1Y6tMOlWZnRYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-vOPkf17YPPOwAJfNH0zykA-1; Tue, 28 Jan 2020 08:23:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7887713E5;
	Tue, 28 Jan 2020 13:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 187C98702A;
	Tue, 28 Jan 2020 13:22:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37ED31819ACE;
	Tue, 28 Jan 2020 13:22:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00SDMXHD020219 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 08:22:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF3572026D67; Tue, 28 Jan 2020 13:22:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C622031A48
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 13:22:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A672801019
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 13:22:31 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
	[148.163.137.20]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-115-l2r5Wd61MY2aop6TITi02A-1; Tue, 28 Jan 2020 08:22:29 -0500
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00SDExrW008374
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 08:22:28 -0500
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
	[67.231.157.37])
	by mx0b-00154904.pphosted.com with ESMTP id 2xrk7ru1ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 08:22:28 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00SDJCHm040582
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 08:22:28 -0500
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
	[143.166.85.207])
	by mx0b-00154901.pphosted.com with ESMTP id 2xrh3ervey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 08:22:28 -0500
X-LoopCount0: from 10.166.132.131
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,346,1549951200"; d="scan'208";a="1351988839"
From: <Sreenivas.Honnur@dell.com>
To: <dm-devel@redhat.com>
Thread-Topic: [dm-devel] device blacklisting and suspend issue
Thread-Index: AdXV3cULSccvTIM/R9ah9Pn2zUtvDg==
Date: Tue, 28 Jan 2020 13:22:23 +0000
Message-ID: <5fb5dfe2cd274b0091076df214fd25a5@BLRX13MDC419.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Sreenivas_Honnur@Dell.com;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-01-25T07:51:42.9325008Z;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
	aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [143.166.11.234]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-01-28_03:2020-01-28,
	2020-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	suspectscore=0
	priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
	phishscore=0 mlxlogscore=941 bulkscore=0 clxscore=1015 spamscore=0
	lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-1911200001 definitions=main-2001280107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	malwarescore=0 phishscore=0
	spamscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
	adultscore=0
	bulkscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1911200001 definitions=main-2001280106
X-MC-Unique: l2r5Wd61MY2aop6TITi02A-1
X-MC-Unique: vOPkf17YPPOwAJfNH0zykA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00SDMXHD020219
X-loop: dm-devel@redhat.com
Subject: [dm-devel]  device blacklisting and suspend issue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have below queries, help is appreciated.

1.	We have an issue with device blacklisting. To blacklist a device we add an entry in /etc/multipath.conf" and do "service multipathd reload". After this to check if device is blacklisted we issue "multipathd show blacklist" command in a loop(with a delay of 10 second). Sometimes I see that this command takes too much time to come out or sometimes it just hangs. 
	a. Is this the correct way to check if device is blacklisted? Or is there any other way to do it?
	b. Is "multipathd reload" a async call? Is there a way to know that "multipathd reload" is completed?

2.	After suspending (dmsetup suspend wwid) a device,  is there a way to inform multipathd not to make it active if some events happen on this device(like new path added..etc...I see that the table is reloaded and device becomes active)
How to avoid this i.e. the device should be in "suspended" state until I do a "resume" on it, "multipathd" should not enable it until I do "dmsetup resume"

3.  " blk_cloned_rq_check_limits: over max size limit." Error I have a requirement to change(decrease) the max_sector_kb value of a device, when I do that (using "echo value /sys/block/dm-x/queue/max_sector_kb) I hit above error.
How I can I avoid this error when I change the max_sector_kb value?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

