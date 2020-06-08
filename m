Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1492B1F148C
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 10:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591605197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bbcphhtNKZ1qv1wFoxnSs7B3JCY2xI8J/suTmz7HiH4=;
	b=YjGFDF+5vAX77PafrN1E2iblHMqETBub8ma90bAaZWtP5h0neWttSGDgaG1pbH0L5xlAUh
	lJ4tXpGheyUIzQb9ieD4M9tnK+2e2l68RAmAUYEOYj9UmjB2ybzd0xo3/8WWNdLeO/NRqs
	/9S76k2n9tIyPVTJT7dYP9YCpKMqch0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-vNADWRMHPFqw7tAW55N2KA-1; Mon, 08 Jun 2020 04:33:15 -0400
X-MC-Unique: vNADWRMHPFqw7tAW55N2KA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 952E2100CCD2;
	Mon,  8 Jun 2020 08:33:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B81261D8;
	Mon,  8 Jun 2020 08:33:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A3B014CFC;
	Mon,  8 Jun 2020 08:33:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0581jKKb003281 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 7 Jun 2020 21:45:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1DC4110F0C0; Mon,  8 Jun 2020 01:45:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE42110F3BD
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 01:45:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 548A21019CA8
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 01:45:18 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-JtTtwFIwPE6IYZ74Hrt9zQ-1; Sun, 07 Jun 2020 21:45:13 -0400
X-MC-Unique: JtTtwFIwPE6IYZ74Hrt9zQ-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 5471B8E4269234BDB10B;
	Mon,  8 Jun 2020 09:45:07 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.218) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 8 Jun 2020 09:45:03 +0800
To: Bryan Gurney <bgurney@redhat.com>
References: <20200605073201.1742675-1-yangerkun@huawei.com>
	<20200605073201.1742675-3-yangerkun@huawei.com>
	<CAHhmqcRaSBW0q1=Zj-eeTCH2mFxc5L5ec_x8ccQVHxSSN6VB7w@mail.gmail.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <506e58ae-082e-c37f-b401-13dfb8002870@huawei.com>
Date: Mon, 8 Jun 2020 09:45:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHhmqcRaSBW0q1=Zj-eeTCH2mFxc5L5ec_x8ccQVHxSSN6VB7w@mail.gmail.com>
X-Originating-IP: [10.166.212.218]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0581jKKb003281
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 04:30:57 -0400
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	"Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC 2/2] dm dust: introduce listbadblocks in the rst
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

CgrlnKggMjAyMC82LzYgMzo0NywgQnJ5YW4gR3VybmV5IOWGmemBkzoKPiBPbiBGcmksIEp1biA1
LCAyMDIwIGF0IDM6NDggQU0geWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGU6
Cj4+Cj4+IFNpbmNlIHdlIHN1cHBvcnQgdGhlIGxpc3RiYWRibG9ja3MgY29tbWFuZCwgaW50cm9k
dWNlIHRoZSBkZXRhaWwgaW4gdGhlCj4+IGRvYy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogeWFuZ2Vy
a3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBkb2N1bWVu
dGF0aW9uLiAgSSBoYXZlIGEgZmV3IGNvcnJlY3Rpb25zIGxpc3RlZCBiZWxvdzoKPiAKPj4gLS0t
Cj4+ICAgLi4uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tZHVzdC5yc3QgICAgICAgIHwg
MTYgKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBw
ZXIvZG0tZHVzdC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIv
ZG0tZHVzdC5yc3QKPj4gaW5kZXggYjZlN2U3ZWFkODMxLi4xODViM2NlNjI5OGIgMTAwNjQ0Cj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9kbS1kdXN0LnJz
dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tZHVz
dC5yc3QKPj4gQEAgLTIwNSw2ICsyMDUsMjEgQEAgYXBwZWFyOjoKPj4KPj4gICAgICAgICAgIGtl
cm5lbDogZGV2aWNlLW1hcHBlcjogZHVzdDogY2xlYXJiYWRibG9ja3M6IG5vIGJhZGJsb2NrcyBm
b3VuZAo+Pgo+PiArTGlzdGxpbmcgdGhlIGJhZCBibG9jayBsaXN0Cj4gCj4gIkxpc3RpbmcgdGhl
IGJhZCBibG9jayBsaXN0Igo+IAo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICsK
Pj4gK1RvIGxpc3QgYWxsIGJhZCBibG9jayBsaXN0LCBydW4gdGhlIGZvbGxvd2luZyBtZXNzYWdl
IGNvbW1hbmQ6Ogo+IAo+ICJUbyBsaXN0IGFsbCBiYWQgYmxvY2tzIGluIHRoZSBiYWQgYmxvY2sg
bGlzdCIKPiAKPj4gKwo+PiArICAgICAgICAkIHN1ZG8gZG1zZXR1cCBtZXNzYWdlIGR1c3QxIDAg
bGlzdGJhZGJsb2Nrcwo+PiArCj4+ICtXZSB3aWxsIGdldCBmb2xsb3dpbmcgbWVzc2FnZShpbWFn
ZSB0aGF0IHdlIGhhdmUgaW5zZXJ0IGJsb2NrIDEvMiwgYW5kCj4+ICt3ZSB3aWxsIGxpc3QgdGhl
IGJsb2NrIGluZGV4IGluIG9yZGVyKTo6Cj4gCj4gIlRoZSBmb2xsb3dpbmcgbWVzc2FnZSB3aWxs
IGFwcGVhciwgbGlzdGluZyBvbmUgYmFkIGJsb2NrIG51bWJlciBwZXIKPiBsaW5lICh1c2luZyBh
biBleGFtcGxlIGRldmljZSB3aXRoIGJsb2NrcyAxIGFuZCAyIGluIHRoZSBiYWQgYmxvY2sKPiBs
aXN0KSIKPiAKPiBBZnRlciB0aG9zZSBjb3JyZWN0aW9ucyBhcmUgbWFkZSwKPiAKPiBSZXZpZXdl
ZC1ieTogQnJ5YW4gR3VybmV5IDxiZ3VybmV5QHJlZGhhdC5jb20+CgoKVGhhbmtzIGZvciB5b3Vy
IGFkdmlzZSBmb3IgdGhpcyBzZXJpZXMsIEkgd2lsbCBmaXggaXQgYW5kIHNlbmQgdjIgd2l0aAp5
b3VyIHJldmlldyB0YWchCgpUaGFua3MsCkt1bi4KCj4gCj4gCj4gVGhhbmtzLAo+IAo+IEJyeWFu
Cj4gCj4gCj4gCj4+ICsKPj4gKyAgICAgICAgZGV2aWNlLW1hcHBlcjogZHVzdDogZHVzdF9saXN0
X2JhZGJsb2NrczogYmFkYmxvY2tzIGxpc3QgYXMgYmVsb3c6Cj4+ICsgICAgICAgIGRldmljZS1t
YXBwZXI6IGR1c3Q6IGJhZCBibG9jazogMQo+PiArICAgICAgICBkZXZpY2UtbWFwcGVyOiBkdXN0
OiBiYWQgYmxvY2s6IDIKPj4gKyAgICAgICAgZGV2aWNlLW1hcHBlcjogZHVzdDogZHVzdF9saXN0
X2JhZGJsb2NrczogYmFkYmxvY2tzIGxpc3QgZW5kLgo+PiArCj4+ICAgTWVzc2FnZSBjb21tYW5k
cyBsaXN0Cj4+ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Cj4+IEBAIC0yMjMsNiArMjM4LDcg
QEAgU2luZ2xlIGFyZ3VtZW50IG1lc3NhZ2UgY29tbWFuZHM6Ogo+Pgo+PiAgICAgICAgICAgY291
bnRiYWRibG9ja3MKPj4gICAgICAgICAgIGNsZWFyYmFkYmxvY2tzCj4+ICsgICAgICAgIGxpc3Ri
YWRibG9ja3MKPj4gICAgICAgICAgIGRpc2FibGUKPj4gICAgICAgICAgIGVuYWJsZQo+PiAgICAg
ICAgICAgcXVpZXQKPj4gLS0KPj4gMi4yNS40Cj4+Cj4gCj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RtLWRldmVs

