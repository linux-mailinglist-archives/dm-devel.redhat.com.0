Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 74CB61AD66D
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7cfcaZIc3FcBeFTYnZwVQVlHud/0tlubFQ57T+plfXY=;
	b=fNtitQFcq0FrMj2n+n0gjvF2/0xJNngKaMYlbiHKindzuZsF2C1ub2xQCUsV7Mq7qiGKIO
	qa/qy2ZtWPjfbA8JT7n/hLr282AIkiafIG4Zm/rT3RccjvhJIyxdGJLVkeDNWdba/2hwIo
	ricGsO+dSSUfTHjNUtCYlglLRmZhTxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-qCkAldzHPXycmLVuLcD4yg-1; Fri, 17 Apr 2020 02:44:25 -0400
X-MC-Unique: qCkAldzHPXycmLVuLcD4yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0F3B1084424;
	Fri, 17 Apr 2020 06:44:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9EC111A086;
	Fri, 17 Apr 2020 06:44:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62E6E1809567;
	Fri, 17 Apr 2020 06:44:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03H0s2pE016612 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 20:54:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92FF22166B2C; Fri, 17 Apr 2020 00:54:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F11F2166B30
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:53:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96A78026E3
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:53:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-359-05VNeE1rPvadKfbI63EuuA-1;
	Thu, 16 Apr 2020 20:53:57 -0400
X-MC-Unique: 05VNeE1rPvadKfbI63EuuA-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id B5E5320B46F0;
	Thu, 16 Apr 2020 17:53:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B5E5320B46F0
To: Mimi Zohar <zohar@linux.ibm.com>, "Lev R. Oshvang ." <levonshe@gmail.com>,
	Stephen Smalley <stephen.smalley@gmail.com>
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
	<CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
	<1586826679.7311.174.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <96c53a34-315c-946d-3264-e6e2cd19f583@linux.microsoft.com>
Date: Thu, 16 Apr 2020 17:53:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1586826679.7311.174.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03H0s2pE016612
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com,
	SELinux <selinux@vger.kernel.org>, dm-devel@redhat.com,
	James Morris <jmorris@namei.org>, chpebeni@linux.microsoft.com,
	LSM List <linux-security-module@vger.kernel.org>,
	suredd@microsoft.com, linux-integrity@vger.kernel.org,
	balajib@microsoft.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLTA0LTEzIDY6MTEgcC5tLiwgTWltaSBab2hhciB3cm90ZToKPiBPbiBTdW4sIDIw
MjAtMDQtMTIgYXQgMTE6MTUgKzAzMDAsIExldiBSLiBPc2h2YW5nIC4gd3JvdGU6Cj4+IE9uIFNh
dCwgQXByIDExLCAyMDIwIGF0IDEwOjA3IFBNIFN0ZXBoZW4gU21hbGxleQo+PiBJdCBzZWVzIHRv
IG1lIHRoYXQgIExLUkcgKGtlcm5lbCBydW4gdGltZSBndWFyZCkgIHRha2VzIHRoZSByb2xlIG9m
Cj4+IG1lYXN1cmluZyBrZXJuZWwgc3RydWN0dXJlcy4gIFBlcmhhcHMgeW91IG5lZWQgdG8gY29u
c3VsdCB3aXRoIExLUkcKPj4gZ3V5cy4KPiAKPiBUaGVyZSBkZWZpbml0ZWx5IHNvdW5kcyBsaWtl
IHRoZXJlIGlzIHNvbWUgb3ZlcmxhcC4gwqBMS1JHIHNlZW1zIHRvIGJlCj4gbWVhc3VyaW5nIGtl
cm5lbCBzdHJ1Y3R1cmVzIGZvciBlbmZvcmNpbmcgbG9jYWwgaW50ZWdyaXR5LiDCoEluIHRoZQo+
IGNvbnRleHQgb2YgSU1BLCBtZWFzdXJlbWVudHMgYXJlIGluY2x1ZGVkIGluIHRoZSBJTUEgbWVh
c3VyZW1lbnQgbGlzdAo+IGFuZCB1c2VkIHRvIGV4dGVuZCBhIFRQTSBQQ1Igc28gdGhhdCBpdCBj
YW4gYmUgcXVvdGVkLgo+IAo+IEEgZ2VuZXJpYyBtZXRob2QgZm9yIG1lYXN1cmluZyBzdHJ1Y3R1
cmVzIGFuZCBpbmNsdWRpbmcgdGhlbSBpbiB0aGUKPiBJTUEgbWVhc3VyZW1lbnQgbGlzdCBzb3Vu
ZHMgaW50ZXJlc3RpbmcuClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIE1pbWkuCldlIHdlcmUgYWxz
byB0aGlua2luZyBhbG9uZyB0aGUgc2FtZSBsaW5lcyBvZiBnZW5lcmljIG1ldGhvZApmb3IgbWVh
c3VyaW5nIHN0cnVjdHVyZXMuCldlIHdpbGwgdGFrZSB0aGlzIGZlZWRiYWNrIGludG8gYWNjb3Vu
dCB3aGlsZSBpbXBsZW1lbnRpbmcuCj4gCj4gTWltaQo+IAoKCi0tCmRtLWRldmVsIG1haWxpbmcg
bGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kbS1kZXZlbA==

