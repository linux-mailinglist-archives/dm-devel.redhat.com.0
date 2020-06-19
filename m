Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 395912008D4
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tiWXtD9MnVPKhM834lTVcR3FFT6LvC4RFaBWGqDdV0Y=;
	b=R6wRDspz9FWw75QRglBY1qgt3QnnnCLbuw+1u8FgbRmrQv0kEuooL36cIpAxfCcsOyP16p
	uWko2Zu/5FjA4WKMin2hKwRM82bfMRU7YtxaVTdzUuQdBZyDFH13/petaMlp3k7Ol4P/0F
	CZJUCnvs7t+z9x2CBQinzZhFdUKGZaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-iF_ngt-EOg6InWGWhxwN-Q-1; Fri, 19 Jun 2020 08:39:20 -0400
X-MC-Unique: iF_ngt-EOg6InWGWhxwN-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C173835B44;
	Fri, 19 Jun 2020 12:39:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC9C5BAC6;
	Fri, 19 Jun 2020 12:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D64F9833D3;
	Fri, 19 Jun 2020 12:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J184hY000304 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 21:08:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E383202683E; Fri, 19 Jun 2020 01:08:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 499DC2026E1C
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 01:08:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E793800260
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 01:08:02 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-ve1kfBqyN4WhTNlPYcUI7Q-1; Thu, 18 Jun 2020 21:07:57 -0400
X-MC-Unique: ve1kfBqyN4WhTNlPYcUI7Q-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id AA000FB14EE926A8B887;
	Fri, 19 Jun 2020 09:07:49 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.218) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 19 Jun 2020 09:07:45 +0800
To: Mike Snitzer <snitzer@redhat.com>
References: <20200618090620.3517530-1-yangerkun@huawei.com>
	<20200618154050.GA18007@redhat.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <bbbc5700-e795-09eb-ea90-5ef802c87718@huawei.com>
Date: Fri, 19 Jun 2020 09:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200618154050.GA18007@redhat.com>
X-Originating-IP: [10.166.212.218]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J184hY000304
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: bmr@redhat.com, dm-devel@redhat.com, agk@redhat.com, bgurney@redhat.com
Subject: Re: [dm-devel] [PATCH v2 0/2] introduce interface to list all
	badblocks
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64

CgrU2iAyMDIwLzYvMTggMjM6NDAsIE1pa2UgU25pdHplciDQtLXAOgo+IE9uIFRodSwgSnVuIDE4
IDIwMjAgYXQgIDU6MDZhbSAtMDQwMCwKPiB5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3ZWkuY29t
PiB3cm90ZToKPiAKPj4KPj4gVGhpcyBwYXRjaHNldCB3aWxsIGxpc3QgYmFkYmxvY2tzIHdoaWxl
IHdlIGRvICdkbXNldHVwIHN0YXR1cycuCj4+Cj4+IEltYWdlIHRoYXQgd2UgaGF2ZSBtYXJrIGJs
b2NrIDEgYW5kIDIgYXMgYmFkIGJsb2NrLCBydW4gZm9sbG93aW5nCj4+IGNvbW1hbmQgd2lsbCBs
aXN0IGFsbCBiYWQgYmxvY2tzOgo+Pgo+PiAgICAgICQgc3VkbyBkbXNldHVwIHN0YXR1cyBkdXN0
MQo+PiAgICAgIDAgMzM1NTIzODQgZHVzdCAyNTI6MTcgYnlwYXNzIHZlcmJvc2UgYmFkYmxvY2tz
IGxpc3Q6IDEgMgo+Pgo+PiB2MS0+djI6Cj4+IFJlYWxpemUgdGhpcyBsb2dpY2FsIGluIGR1c3Rf
c3RhdHVzIGluc3RlYWQgZHVzdF9tZXNzYWdlIHNpbmNlIHRoZQo+PiByZXN1bHQgY2FuIHJldHVy
biB0byB1c2VyIGRpcmVjdGx5Lgo+IAo+IFNlZW1zIHlvdSd2ZSBtaXN1bmRlZXJzdG9vZC4gIFBs
ZWFzZSBkb24ndCBhdWdtZW50IHN0YXR1cyB0byBpbmNsdWRlIHRoZQo+IGxpc3Rpbmcgb2YgYmFk
YmxvY2tzLiAgVGhlIGxpc3QgX2NvdWxkXyBiZSBleHRyZW1lbHkgbG9uZy4KPiAKPiBUaGUgZmVl
ZGJhY2sgeW91IGdvdCBlYXJsaWVyIHdhcyB0byB1c2UgRE1FTUlUKCkgZnJvbSB0aGUgLm1lc3Nh
Z2UKPiBob29rLiAgQW5kIHRoZSBsaXN0aW5nIHdvdWxkIGJlIHByb3ZpZGVkIGFzIG91dHB1dCBm
cm9tIHRoZSAnZG1zZXR1cAo+IG1lc3NhZ2UgLi4uJyBjb21tYW5kLgoKR290IGl0ISBJdCdzIG15
IG1pc3Rha2UuCgpUaGFua3MsCkt1bi4KPiAKPiBNaWtlCj4gCj4gCj4gLgo+IAoKCi0tCmRtLWRl
dmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

