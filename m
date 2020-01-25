Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D69C01493EF
	for <lists+dm-devel@lfdr.de>; Sat, 25 Jan 2020 08:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579938876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=50CViiXmtW5n/a82l+r1F5fFdz9cPd3kjweJnD0GZfU=;
	b=X8W/7Cqa3yD/UJPgvIOGK1w/nPY4Zb3QRW6iLtP1QNR/VP1s89tqOxi3CS1g2ZZP1uuaHi
	GYS7SnkweKsNZLxa7db+ywvODBUwQ7qgccOwmFM+F46jkPiEgnc325CwbV0GaxhZRlKv49
	XzOni1JgbcRAwVSTFxTGYH4FexlT7sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-O62MpgoMOFeBFnm2UKbwBA-1; Sat, 25 Jan 2020 02:54:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01709107ACC4;
	Sat, 25 Jan 2020 07:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 316A65DDAA;
	Sat, 25 Jan 2020 07:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AC4F1809567;
	Sat, 25 Jan 2020 07:54:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P7rk5X031325 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Jan 2020 02:53:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BFF72121139; Sat, 25 Jan 2020 07:53:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA93F11D2B3
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 07:53:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 384E88EB44F
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 07:53:44 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
	[148.163.137.20]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-224-3KbHWiwiPNyrv7PbnqxbxA-1; Sat, 25 Jan 2020 02:53:42 -0500
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00P7o9xB008117
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:53:42 -0500
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
	[67.231.157.37])
	by mx0b-00154904.pphosted.com with ESMTP id 2xr631hwkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:53:41 -0500
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	00P7rfbl002863
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:53:41 -0500
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com
	[143.166.148.206])
	by mx0b-00154901.pphosted.com with ESMTP id 2xr622q3sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:53:41 -0500
X-LoopCount0: from 10.166.135.108
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="1402361216"
From: <Sreenivas.Honnur@dell.com>
To: <dm-devel@redhat.com>
Thread-Topic: device blacklisting and suspend issue
Thread-Index: AdXTU0MOTdIfX9+0S+O/q/SIh5mHdg==
Date: Sat, 25 Jan 2020 07:51:54 +0000
Message-ID: <a06c41ee9a6a40288b05d016455469ab@BLRX13MDC419.AMER.DELL.COM>
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
	definitions=2020-01-25_02:2020-01-24,
	2020-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 mlxlogscore=828
	phishscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1911200001 definitions=main-2001250067
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=949
	phishscore=0
	priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0
	lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
	impostorscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1911200001 definitions=main-2001250066
X-MC-Unique: 3KbHWiwiPNyrv7PbnqxbxA-1
X-MC-Unique: O62MpgoMOFeBFnm2UKbwBA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00P7rk5X031325
X-loop: dm-devel@redhat.com
Subject: [dm-devel] device blacklisting and suspend issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have below queries, help is appreciated.

1.	We have an issue with device blacklisting. To blacklist a device we add an entry in /etc/multipath.conf" and do "service multipathd reload". After this to check if device is blacklisted we issue "multipathd show blacklist" command in a loop(with a delay of 10 second). Sometimes I see that this command takes too much time to come out or sometimes it just hangs. 
	a. Is this the correct way to check if device is blacklisted? Or is there any other way to do it?
	b. Is "multipathd reload" a async call? Is there a way to know that "multipathd reload" is completed?

2.	After suspending (dmsetup suspend wwid) a device,  is there a way to inform multipathd not to make it active if some events happen on this device(like new path added..etc...I see that the table is reloaded and device becomes active)
How to avoid this i.e. the device should be in "suspended" state until I do a "resume" on it, "multipathd" should not enable it until I do "dmsetup resume"

3.  " blk_cloned_rq_check_limits: over max size limit." Error
I have a requirement to change(decrease) the max_sector_kb value of a device, when I do that (using "echo value /sys/block/dm-x/queue/max_sector_kb) I hit above error.
How I can I avoid this error when I change the max_sector_kb value?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

