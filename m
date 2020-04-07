Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DD3521A1C77
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 09:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586330480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gcNGBfA+bjDbeDz7dLr+RaS9HZp5XlRoab0TA7G3vJo=;
	b=Lrwx/LrdT5uzS/cbO4odu/P2uoQiyr+coidrTg7QGDNRO96g/UeEHW0QlfWur4CYJiI94S
	5i+8n7k52JgNwSP/aGMIcySgRBIH/GR//tUfus1WTSttGNhnf74OCmhGKPvu8aWI6/0eHQ
	V871Q9Y2SaURBhIAMA22iHyRlKl4gEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Gv1n_W5aNmutq6iha3jNUQ-1; Wed, 08 Apr 2020 03:21:18 -0400
X-MC-Unique: Gv1n_W5aNmutq6iha3jNUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD18190D349;
	Wed,  8 Apr 2020 07:21:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9265C3F8;
	Wed,  8 Apr 2020 07:21:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E3BF93A89;
	Wed,  8 Apr 2020 07:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037LW6g7017993 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 17:32:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5E892022EA7; Tue,  7 Apr 2020 21:32:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A12C62026D69
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 21:32:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A5EE8F6901
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 21:32:04 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-133-HD5IE4vGMgmK8MrUkT6xCQ-1; Tue, 07 Apr 2020 17:32:01 -0400
X-MC-Unique: HD5IE4vGMgmK8MrUkT6xCQ-1
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	037L4hBs104038; Tue, 7 Apr 2020 17:31:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3082hh5qp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 07 Apr 2020 17:31:59 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 037LRsKx015276;
	Tue, 7 Apr 2020 17:31:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
	[169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3082hh5qng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 07 Apr 2020 17:31:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id
	037LUbr1023206; Tue, 7 Apr 2020 21:31:57 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
	[9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 306hv69vxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 07 Apr 2020 21:31:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	037LVuCl12845986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 7 Apr 2020 21:31:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7712B2066;
	Tue,  7 Apr 2020 21:31:56 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66031B2068;
	Tue,  7 Apr 2020 21:31:55 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.65.198.190])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue,  7 Apr 2020 21:31:55 +0000 (GMT)
To: deven.desai@linux.microsoft.com
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <c1466cc8-8a08-708a-4629-234485bb833e@linux.vnet.ibm.com>
Date: Tue, 7 Apr 2020 17:31:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
	definitions=2020-04-07_09:2020-04-07,
	2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 adultscore=0
	mlxlogscore=999 spamscore=0 clxscore=1011 malwarescore=0
	impostorscore=0
	lowpriorityscore=0 suspectscore=1 mlxscore=0 phishscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004070166
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 037L4hBs104038
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037LW6g7017993
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Apr 2020 03:20:33 -0400
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	mdsakib@linux.microsoft.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v2 00/12] Integrity Policy Enforcement
	LSM (IPE)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDQvNi8yMCA2OjE0IFBNLCBkZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tIHdyb3Rl
Ogo+IEZyb206IERldmVuIEJvd2VycyA8ZGV2ZW4uZGVzYWlAbGludXgubWljcm9zb2Z0LmNvbT4K
Pgo+IENoYW5nZWxvZzoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+
IHYxOiBJbnRyb2R1Y2VkCj4KPiB2MjoKPiAgICBTcGxpdCB0aGUgc2Vjb25kIHBhdGNoIG9mIHRo
ZSBwcmV2aW91cyBzZXJpZXMgaW50byB0d28uCj4gICAgTWlub3IgY29ycmVjdGlvbnMgaW4gdGhl
IGNvdmVyLWxldHRlciBhbmQgZG9jdW1lbnRhdGlvbgo+ICAgIGNvbW1lbnRzIHJlZ2FyZGluZyBD
QVBfTUFDX0FETUlOIGNoZWNrcyBpbiBJUEUuCj4KPiBPdmVydmlldzoKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBJUEUgaXMgYSBMaW51eCBTZWN1cml0eSBNb2R1bGUs
IHdoaWNoIGFsbG93cyBmb3IgYSBjb25maWd1cmFibGUKPiBwb2xpY3kgdG8gZW5mb3JjZSBpbnRl
Z3JpdHkgcmVxdWlyZW1lbnRzIG9uIHRoZSB3aG9sZSBzeXN0ZW0uIEl0Cj4gYXR0ZW1wdHMgdG8g
c29sdmUgdGhlIGlzc3VlIG9mIENvZGUgSW50ZWdyaXR5OiB0aGF0IGFueSBjb2RlIGJlaW5nCj4g
ZXhlY3V0ZWQgKG9yIGZpbGVzIGJlaW5nIHJlYWQpLCBhcmUgaWRlbnRpY2FsIHRvIHRoZSB2ZXJz
aW9uIHRoYXQKPiB3YXMgYnVpbHQgYnkgYSB0cnVzdGVkIHNvdXJjZS4KCkNhbiB5b3UgcGxlYXNl
IGNsYXJpZnkgdGhlICJtb3RpdmF0aW9uIiBmb3IgdGhpcyBwYXRjaCBzZXQgbW9yZSBjbGVhcmx5
PyAKSXQgc2VlbXMgdG8gZGVmaW5lIGEgcG9saWN5IGxheWVyIG9uIHRvcCBvZiBkbS12ZXJpdHks
IHdoaWNoIG1heSBiZSAKY29tcGlsZWQgaW50byB0aGUga2VybmVsLiBJbiB0aGUgbW90aXZhdGlv
biwgY2FuIHlvdSBwbGVhc2UgYWxzbyBtYWtlIGl0IApleHBsaWNpdCB3aHkgZXhpc3RpbmcgbWVj
aGFuaXNtcyBjYW5ub3QgYmUgZXh0ZW5kZWQgdG8gYWNoaWV2ZSB5b3VyIHB1cnBvc2U/CgpBbHNv
LCBBRklLLCB0aGUgY2hhbmdlbG9nIHNob3VsZCBiZSBtb3ZlZCB0byB0aGUgZW5kIG9mIHRoZSBw
YXRjaCAKZGVzY3JpcHRpb24uCgpUaGFua3MgJiBSZWdhcmRzLAoKIMKgwqDCoCAtIE5heW5hCgoK
LS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cu
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

