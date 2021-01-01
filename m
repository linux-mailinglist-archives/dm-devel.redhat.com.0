Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 75A832E9DE7
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:05:03 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-fsIabR-KMoSSBerWRsaXGg-1; Mon, 04 Jan 2021 14:04:52 -0500
X-MC-Unique: fsIabR-KMoSSBerWRsaXGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF1F4800050;
	Mon,  4 Jan 2021 19:04:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAE991002393;
	Mon,  4 Jan 2021 19:04:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77AEB5002C;
	Mon,  4 Jan 2021 19:04:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 101BiPhP013086 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 06:44:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70501110FC1A; Fri,  1 Jan 2021 11:44:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C617112D40B
	for <dm-devel@redhat.com>; Fri,  1 Jan 2021 11:44:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D31E78007D9
	for <dm-devel@redhat.com>; Fri,  1 Jan 2021 11:44:22 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-191-mqP2MOg_MU2La7TFypWxHg-1;
	Fri, 01 Jan 2021 06:44:20 -0500
X-MC-Unique: mqP2MOg_MU2La7TFypWxHg-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.196]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MNcMo-1kwxjy3KSQ-007AwB
	for <dm-devel@redhat.com>; Fri, 01 Jan 2021 12:39:16 +0100
Date: Fri, 1 Jan 2021 12:39:15 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: dm-devel <dm-devel@redhat.com>
Message-ID: <20210101123915.4aa06611@gecko.fritz.box>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LehpLm4qICjt2CodzN2f63S6UpyUxDS/cTjjlJ0Vrbo8jQG+174
	P2ChLkzoLxgy6DbU+RoU9eRrfA2ryaw0u9E5zZDxjhzC0ID6+46oC/2qgwYb8N3Sd465/uV
	Y+PZ762pyWKqiFqJfmqqa0Gi5TCFD/erybagrFVSCASbbUvEIPQrBtMI10pPR32YEB7/nO7
	8y9UjNeSgYvuBdR/m1Nsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:02HvA7Tnz/I=:iWE03ZZSFMN38EC2mLSlzW
	Meuzr3MXYMCPcNn4o3YzIm7Ai5IJlw+H116biWxrESNoBFcUGtXzFnA7h+LRN15GoNczLHoSP
	SN09MG0j75lESA9s25EDXuBES4ajVhweWdTn01/cCAJFlSjLb0WWoweTg99FmKEINrUrjPyGp
	YILFQCtFNuCrTHx7ByS5GYy/sQJ2C63CSWpIXNPE83Qv4P1ZeM22sRuVq19Q2asObn/KyU3GS
	LemdsFMikdqBNB+/0EbXA23HnrxjIq4Pf8xNoZcdtNG6RALc+geXveRrBz2WlJ43qFyeAFEZD
	ObZXB1RHYbZ2joHPX15pxiUyd4/R1pEudkR7b3lhFvIdzvGqejuZ6KqWlo1TLjjMSSUH1Zv4n
	rOYPZNd5RcpKVSCpDorvrIHRIPxCUABsLC7XRbH4Ovlzt5d1XFDQ9SxgTqXT8g9ddZWLYGby8
	HQviiTHex50Vj7jF5aFJjkb4WmDMc8CFC5Iv+knDTDx5d1knyEATxHw4AaEMmBA/sYilI18Ck
	BvUDMwgBPux1NmkCfiCnjFwHYIaG9H3Y2K9iJXMrflIakWtOvrtDbl3MMLWTr5mq7UzX9USaS
	haZ325YaDU6FkqmisRsOxCdTChodhQNeYaYTGUYCDv+2Y1ULaNCsmvFJ59yzxSl82gTnnEd1F
	TMv3JW35OMmw/Zom6c+gMJ8DAN83tdjYkKdNENfSMjK1Xw0X6tvJDUZJYRmiWdNp//SADs93a
	O/UcVv77etz21ltuLiRmpieYHWEfjtV01Gj/vzxhIEJmD0UaIf2PVdT6sbHHT8J/OwSglJmrD
	xICxiDlH+mZAJ+QP4vz39HLg6M1l1dDr3cySJMcV1UUxcw5j246ZZhxEdR1NodiiDjLgduKtI
	xWMFtWMiNSbh360R/Uow==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 101BiPhP013086
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Subject: [dm-devel] Test
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a test. It seems that my mails don't reach the mailing-list.

--


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

