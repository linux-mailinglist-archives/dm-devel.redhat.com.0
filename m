Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20AAC25897F
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-fRgOWVpqNluYBNLaUtnDYg-1; Tue, 01 Sep 2020 03:44:15 -0400
X-MC-Unique: fRgOWVpqNluYBNLaUtnDYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DCC41007473;
	Tue,  1 Sep 2020 07:44:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB2D78B49;
	Tue,  1 Sep 2020 07:44:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 201A1181A870;
	Tue,  1 Sep 2020 07:44:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VIFN4t031019 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 14:15:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CB111111424; Mon, 31 Aug 2020 18:15:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6753B1004036
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 18:15:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14D69811E79
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 18:15:21 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-81-sz-_AUd8P3mF-3Z_DYceiA-1; Mon, 31 Aug 2020 14:15:16 -0400
X-MC-Unique: sz-_AUd8P3mF-3Z_DYceiA-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07VICRja010823; Mon, 31 Aug 2020 14:15:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 33969br22s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 14:15:15 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07VIE72t013986;
	Mon, 31 Aug 2020 14:15:15 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 33969br21a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 14:15:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07VICxFc004273; Mon, 31 Aug 2020 18:15:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 337e9gten0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 18:15:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07VIFB4A15860132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 31 Aug 2020 18:15:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9A50A4072;
	Mon, 31 Aug 2020 18:15:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E9EA4069;
	Mon, 31 Aug 2020 18:15:06 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.2.129]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2020 18:15:06 +0000 (GMT)
Message-ID: <652406e1a08d855a5d9a3e3815835653a12df411.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 31 Aug 2020 14:15:05 -0400
In-Reply-To: <20200828015704.6629-5-tusharsu@linux.microsoft.com>
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-5-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-31_08:2020-08-31,
	2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0
	impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
	adultscore=0
	phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008310104
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id 07VICRja010823
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07VIFN4t031019
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 4/6] IMA: add policy to measure critical
 data from kernel components
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA4LTI3IGF0IDE4OjU3IC0wNzAwLCBUdXNoYXIgU3VnYW5kaGkgd3JvdGU6
Cj4gVGhlcmUgd291bGQgYmUgc2V2ZXJhbCBjYW5kaWRhdGUga2VybmVsIGNvbXBvbmVudHMgc3Vp
dGFibGUgZm9yIElNQQo+IG1lYXN1cmVtZW50LiBOb3QgYWxsIG9mIHRoZW0gd291bGQgaGF2ZSBz
dXBwb3J0IGZvciBJTUEgbWVhc3VyZW1lbnQuCj4gQWxzbywgc3lzdGVtIGFkbWluaXN0cmF0b3Jz
IG1heSBub3Qgd2FudCB0byBtZWFzdXJlIGRhdGEgZm9yIGFsbCBvZgo+IHRoZW0sIGV2ZW4gd2hl
biB0aGV5IHN1cHBvcnQgSU1BIG1lYXN1cmVtZW50LiBBbiBJTUEgcG9saWN5IHNwZWNpZmljCj4g
dG8gdmFyaW91cyBrZXJuZWwgY29tcG9uZW50cyBpcyBuZWVkZWQgdG8gbWVhc3VyZSB0aGVpciBy
ZXNwZWN0aXZlCj4gY3JpdGljYWwgZGF0YS4KClRoZSBiYXNlIHBvbGljeSBydWxlcyBhcmUgd2lk
ZSwgYnV0IG1heSBiZSBjb25zdHJhaW5lZCBieSBzcGVjaWZ5aW5nCmRpZmZlcmVudCBvcHRpb25z
LiAgRm9yIGV4YW1wbGUgdGhlIGJ1aWx0aW4gcG9saWN5IHJ1bGVzIGNhbm5vdCBiZQp3cml0dGVu
IGluIHRlcm1zIExTTSBsYWJlbHMsIHdoaWNoIHdvdWxkIGNvbnN0cmFpbiB0aGVtLiAgQSBwb2xp
Y3kgcnVsZQptYXkgbWVhc3VyZSBhbGwga2V5cmluZ3Mgb3IgbWF5IGNvbnN0cmFpbiB3aGljaCBr
ZXlyaW5ncyBuZWVkIHRvIGJlCm1lYXN1cmVkLiAgTWVhc3VyaW5nIGNyaXRpY2FsIGRhdGEgaXMg
bm90IGFueSBkaWZmZXJlbnQuCgpQbGVhc2UgcmV3cml0ZSB0aGUgYWJvdmUgcGFyYWdyYXBoIGFj
Y29yZGluZ2x5LgoKPiAKPiBBZGQgYSBuZXcgSU1BIHBvbGljeSAiY3JpdGljYWxfa2VybmVsX2Rh
dGFfc291cmNlcyIgdG8gc3VwcG9ydCBtZWFzdXJpbmcKPiB2YXJpb3VzIGNyaXRpY2FsIGtlcm5l
bCBjb21wb25lbnRzLiBUaGlzIHBvbGljeSB3b3VsZCBlbmFibGUgdGhlCj4gc3lzdGVtIGFkbWlu
aXN0cmF0b3JzIHRvIGxpbWl0IHRoZSBtZWFzdXJlbWVudCB0byB0aGUgY29tcG9uZW50cywKPiBp
ZiB0aGUgY29tcG9uZW50cyBzdXBwb3J0IElNQSBtZWFzdXJlbWVudC4KCiJjcml0aWNhbF9rZXJu
ZWxfZGF0YV9zb3VyY2VzIiBpcyByZWFsbHkgd29yZHkuICAgRmluZCBhIGJldHRlciwgc2VsZgpk
ZWZpbmluZyB0ZXJtIGZvciBkZXNjcmliaW5nIHRoZSB0eXBlIG9mIGRhdGEsIG9uZSB0aGF0IGlz
bid0IHNvIHdvcmR5LAphbmQgcmVmbGVjdCBpdCBpbiB0aGUgY29kZS4KCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVHVzaGFyIFN1Z2FuZGhpIDx0dXNoYXJzdUBsaW51eC5taWNyb3NvZnQuY29tPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL2ltYV9wb2xpY3kgfCAgMyArKysKPiAgc2Vj
dXJpdHkvaW50ZWdyaXR5L2ltYS9pbWFfcG9saWN5LmMgIHwgMjkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9pbWFfcG9s
aWN5IGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9pbWFfcG9saWN5Cj4gaW5kZXggY2Q1NzI5
MTJjNTkzLi43Y2NkYzE5NjRlMjkgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9pbWFfcG9saWN5Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9pbWFfcG9s
aWN5Cj4gQEAgLTQ4LDYgKzQ4LDkgQEAgRGVzY3JpcHRpb246Cj4gIAkJCXRlbXBsYXRlOj0gbmFt
ZSBvZiBhIGRlZmluZWQgSU1BIHRlbXBsYXRlIHR5cGUKPiAgCQkJKGVnLCBpbWEtbmcpLiBPbmx5
IHZhbGlkIHdoZW4gYWN0aW9uIGlzICJtZWFzdXJlIi4KPiAgCQkJcGNyOj0gZGVjaW1hbCB2YWx1
ZQo+ICsJCQljcml0aWNhbF9rZXJuZWxfZGF0YV9zb3VyY2VzOj0gbGlzdCBvZiBrZXJuZWwKPiAr
CQkJY29tcG9uZW50cyAoZWcsIHNlbGludXh8YXBwYXJtb3J8ZG0tY3J5cHQpIHRoYXQKPiArCQkJ
Y29udGFpbiBkYXRhIGNyaXRpY2FsIHRvIHRoZSBzZWN1cml0eSBvZiB0aGUga2VybmVsLgoKVGhp
cyBvcmlnaW5hbCBwb2xpY3kgZGVmaW5pdGlvbiwgZm9yIHRoZSBtb3N0IHBhcnQsIGlzIGluIEJh
Y2t1c+KAk05hdXIKZm9ybWF0LiAgIFRoZSBrZXlyaW5nIG5hbWVzIGlzIGFuIGV4Y2VwdGlvbiwg
YmVjYXVzZSBpdCBpcyBub3QgbGltaXRlZAp0byBwcmUtZGVmaW5lZCBrZXJuZWwgb2JqZWN0cy4g
IFRoZSBjcml0aWNhbCBkYXRhIGhvb2sgaXMgbWVhc3VyaW5nCnRoaW5ncyBpbiBrZXJuZWwgbWVt
b3J5LiAgQXMgbmV3IGNhbGxzIHRvIG1lYXN1cmUgY3JpdGljYWwgZGF0YSBhcmUKYWRkZWQsIG5l
dyBpZGVudGlmaWVycyB3b3VsZCBiZSBhZGRlZCBoZXJlLgoKRm9yIGV4YW1wbGUsIGlmIFNFTGlu
dXggaXMgdGhlIGZpcnN0IGV4YW1wbGUgb2YgbWVhc3VyaW5nIGNyaXRpY2FsCmRhdGEsIHRoZW4g
dGhlIFNFTGludXggY3JpdGljYWwgZGF0YSBwYXRjaCB3b3VsZCBpbmNsdWRlCiJjcml0aWNhbF9k
YXRhOj0gW3NlbGludXhdIi4gIEVhY2ggc3Vic2VxdWVudCBjcml0aWNhbCBkYXRhIGJlaW5nCm1l
YXN1cmVkIHdvdWxkIGV4dGVuZCB0aGlzIGxpc3QuICBBdCB0aGUgc2FtZSB0aW1lLCB0aGUgbGlz
dCBvZiBrbm93bgoiY3JpdGljYWwgZGF0YSIgZGVmaW5lZCBpbiBwYXRjaCA2LzYgd291bGQgYmUg
dXBkYXRlZC4KCk5vcm1hbGx5IGEgbmV3IGZlYXR1cmUgYW5kIHRoZSBmaXJzdCB1c2FnZSBvZiB0
aGF0IGZlYXR1cmUgYXJlIGluY2x1ZGVkCmluIHRoZSBzYW1lIHBhdGNoIHNldC4gIFNlcGFyYXRp
bmcgdGhlbSBsaWtlIHRoaXMgbWFrZXMgaXQgZGlmZmljdWx0IHRvCndyaXRlLCByZXZpZXcgYW5k
IHVwc3RyZWFtLgoKTWltaQoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

