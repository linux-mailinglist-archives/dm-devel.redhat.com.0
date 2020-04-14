Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 75F841A73B4
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PFqB3g369KUjhk9Ogx8DlcayvDkRKLBpJgBeKT1kbDk=;
	b=eA7zAKYU23TM6XrNbcj8tq/1s/I83/d7CnNq/n9dzXpDxU9G0e6tR/dgRebQdVRNXikNTg
	FoV7bsiOtca0+QSjjR1IzIEK8ObDpiYxUaxG14MMV15VOBica0FrlBa0uv2G27oa7nPNFF
	rszm8DcDpNCZV12yPDoMlqGNpO6QC0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-ZUvaV4eGPv-yWGxudVGG9A-1; Tue, 14 Apr 2020 02:29:50 -0400
X-MC-Unique: ZUvaV4eGPv-yWGxudVGG9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C754D8017F5;
	Tue, 14 Apr 2020 06:29:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E0F911D2CA;
	Tue, 14 Apr 2020 06:29:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EC289306D;
	Tue, 14 Apr 2020 06:29:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E1Bnun017567 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Apr 2020 21:11:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DE012166B2A; Tue, 14 Apr 2020 01:11:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A12C2166B2B
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 01:11:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EC38101A55A
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 01:11:47 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-223-1aPQIpbqP6iN80JDjbtF1g-1; Mon, 13 Apr 2020 21:11:45 -0400
X-MC-Unique: 1aPQIpbqP6iN80JDjbtF1g-1
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	03E13epc126677
	for <dm-devel@redhat.com>; Mon, 13 Apr 2020 21:11:44 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
	by mx0a-001b2d01.pphosted.com with ESMTP id 30bad85mp6-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <dm-devel@redhat.com>; Mon, 13 Apr 2020 21:11:43 -0400
Received: from localhost
	by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <dm-devel@redhat.com> from <zohar@linux.ibm.com>;
	Tue, 14 Apr 2020 02:11:07 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 14 Apr 2020 02:11:04 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 03E1BbiY59244662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 14 Apr 2020 01:11:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B1584C040;
	Tue, 14 Apr 2020 01:11:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB06F4C04A;
	Tue, 14 Apr 2020 01:11:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.203.105])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2020 01:11:35 +0000 (GMT)
From: Mimi Zohar <zohar@linux.ibm.com>
To: "Lev R. Oshvang ." <levonshe@gmail.com>, Stephen Smalley
	<stephen.smalley@gmail.com>
In-Reply-To: <CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
	<CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
Date: Mon, 13 Apr 2020 21:11:19 -0400
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20041401-0016-0000-0000-000003040B42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041401-0017-0000-0000-00003367FE21
Message-Id: <1586826679.7311.174.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
	definitions=2020-04-13_11:2020-04-13,
	2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 mlxscore=0
	mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
	impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 malwarescore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004140001
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 03E13epc126677
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E1Bnun017567
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:25 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com,
	SELinux <selinux@vger.kernel.org>, dm-devel@redhat.com,
	James Morris <jmorris@namei.org>, chpebeni@linux.microsoft.com,
	LSM List <linux-security-module@vger.kernel.org>, suredd@microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIwLTA0LTEyIGF0IDExOjE1ICswMzAwLCBMZXYgUi4gT3NodmFuZyAuIHdyb3Rl
Ogo+IE9uIFNhdCwgQXByIDExLCAyMDIwIGF0IDEwOjA3IFBNIFN0ZXBoZW4gU21hbGxleQo+IEl0
IHNlZXMgdG8gbWUgdGhhdCAgTEtSRyAoa2VybmVsIHJ1biB0aW1lIGd1YXJkKSAgdGFrZXMgdGhl
IHJvbGUgb2YKPiBtZWFzdXJpbmcga2VybmVsIHN0cnVjdHVyZXMuICBQZXJoYXBzIHlvdSBuZWVk
IHRvIGNvbnN1bHQgd2l0aCBMS1JHCj4gZ3V5cy4KClRoZXJlIGRlZmluaXRlbHkgc291bmRzIGxp
a2UgdGhlcmUgaXMgc29tZSBvdmVybGFwLiDCoExLUkcgc2VlbXMgdG8gYmUKbWVhc3VyaW5nIGtl
cm5lbCBzdHJ1Y3R1cmVzIGZvciBlbmZvcmNpbmcgbG9jYWwgaW50ZWdyaXR5LiDCoEluIHRoZQpj
b250ZXh0IG9mIElNQSwgbWVhc3VyZW1lbnRzIGFyZSBpbmNsdWRlZCBpbiB0aGUgSU1BIG1lYXN1
cmVtZW50IGxpc3QKYW5kIHVzZWQgdG8gZXh0ZW5kIGEgVFBNIFBDUiBzbyB0aGF0IGl0IGNhbiBi
ZSBxdW90ZWQuCgpBIGdlbmVyaWMgbWV0aG9kIGZvciBtZWFzdXJpbmcgc3RydWN0dXJlcyBhbmQg
aW5jbHVkaW5nIHRoZW0gaW4gdGhlCklNQSBtZWFzdXJlbWVudCBsaXN0IHNvdW5kcyBpbnRlcmVz
dGluZy4KCk1pbWkKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

