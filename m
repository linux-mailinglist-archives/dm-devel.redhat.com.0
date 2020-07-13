Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A53F21CD38
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 04:31:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-IjAcZmzdMnmIAJizTEvRHA-1; Sun, 12 Jul 2020 22:31:14 -0400
X-MC-Unique: IjAcZmzdMnmIAJizTEvRHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4875A102C7EE;
	Mon, 13 Jul 2020 02:31:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C905E724D4;
	Mon, 13 Jul 2020 02:31:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8A1E180954D;
	Mon, 13 Jul 2020 02:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06D2UvTk019005 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 22:30:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EF24E2A68; Mon, 13 Jul 2020 02:30:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A323E2A6D
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 02:30:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9739F800394
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 02:30:50 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-497-wBXehi2EP6S7LUX_Dccdiw-1; Sun, 12 Jul 2020 22:30:46 -0400
X-MC-Unique: wBXehi2EP6S7LUX_Dccdiw-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 1F2A1A668D20533C806B;
	Mon, 13 Jul 2020 10:15:15 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Jul 2020
	10:15:09 +0800
To: Zdenek Kabelac <zkabelac@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Martin Wilck <mwilck@suse.com>, "Benjamin
	Marzinski" <bmarzins@redhat.com>
References: <6eb10725-456f-de68-e927-1f5a9771c16c@huawei.com>
	<86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <0d26c9f6-4379-f201-a9a5-839bddef3f25@huawei.com>
Date: Mon, 13 Jul 2020 10:15:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <86d8307c-1747-2254-4f87-fac36f0d51ca@redhat.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06D2UvTk019005
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, dm-devel@redhat.com, liuzhiqiang26@huawei.com,
	lutianxiong@huawei.com
Subject: Re: [dm-devel] [lvm-devel] master - multipathd: fix fd leak when
 iscsi device logs in
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

SGkKCk5vdyB0aGUgbnVtYmVyIG9mIGZkIHBvaW50aW5nIC9kZXYvbWFwcGVyL2NvbnRyb2wgaW4g
bXVsdGlwYXRoZCBwcm9jZXNzCmluY3JlYXNlcyB3aGVuIGlzY3NpIGRldmljZSBsb2dzIGluLiBU
aGUgcmVhc29uIGlzIHRoYXQgd2FpdF9kbWV2ZW50cwp0aHJlYWQgYW5kIHVldnFsb29wIHRocmVh
ZCBjYWxsIF9vcGVuX2FuZF9hc3NpZ25fY29udHJvbF9mZCBjb25jdXJyZW50bHkuCklmIGxvY2sg
YWRkIHRvIF9vcGVuX2FuZF9hc3NpZ25fY29udHJvbF9mZCBmdW4gaW4gbHZtMi9saWJkbS9saWJk
bS1pZmFjZS5jLAp0aGUgdHJvdWJsZSBpcyBzb2x2ZWQgZWFzaWx5IGJ1dCBaZGVuZWsgS2FiZWxh
YyBzYWlkIHRoYXQgbGliZG0gaXMgbm90CnB0aHJlYWQgYXdhcmUvc2FmZSBsaWJyYXJ5LlNvIHRo
ZSBsb2NrIGNvdWxkIG5vdCBiZSBhZGRlZCB0byBsaWJkbS4gSWYKdGhlIGxvY2sgYWRkIHRvIG11
bHRpcGF0aC10b29scywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZiBwb3NpdGlvbnMgd2hlcmUKZG1f
dGFza19ydW4gaXMgY2FsbGVkIGFuZCB0aGUgbG9jayBzaHVvbGQgYmUgYWRkZWQuIEl0IG1heSBk
ZWdyYWRlCm11bHRpcGF0aC10b29scycgcGVyZm9ybWFuY2UuIEkgZG9uJ3QgaGF2ZSBhbnkgb3Ro
ZXIgZ29vZCBpZGVhIGFib3V0CnRoaXMgdHJvdWJsZS4gRG8geW91IGhhdmUgc29tZSBnb29kIGlk
ZWEgYWJvdXQgaXQ/IFRoZXJlIGlzIGFuIGFub3RoZXIKcHJvYmxlbSB0byBtZS4gTXVsdGlwYXRo
ZCBpcyBhIHByb2Nlc3Mgd2l0aCBtdWx0aS10aHJlYWQgYW5kIGxpYmRtIGlzCm5vdCBwdGhyZWFk
IGF3YXJlL3NhZmUgbGlicmFyeSwgd2h5IG11bHRpcGF0aGQgdXNlIGxpYmRtIHdpdGggbm8KcHJv
dGVjdO+8nyBUaGFua3MuCgpUaGUgcHJvY2VkdXJlIGRldGFpbHMgd2hlbiBmZCBsZWFrIG9jY3Vy
cyBnaXZlbiBhcyBmb2xsb3dzOgoxLiB3YWl0X2RtZXZlbnRzIHRocmVhZAp3YWl0X2RtZXZlbnRz
Ci0+ZG1ldmVudF9sb29wCiAgICAtPmRtX2dldF9ldmVudHMgKC0+ZG1faXNfbXBhdGgpCiAgICAg
ICAgLT5kbV90YXNrX3J1bgogICAgICAgICAgICAtPl9vcGVuX2NvbnRyb2wKICAgICAgICAgICAg
ICAgIC0+X29wZW5fYW5kX2Fzc2lnbl9jb250cm9sX2ZkCgoyLiB1ZXZxbG9vcCB0aHJlYWQKdWV2
cWxvb3AKLT51ZXZlbnRfZGlzcGF0Y2gKICAgIC0+c2VydmljZV91ZXZxCiAgICAgICAgLT5ldl9h
ZGRfcGF0aAogICAgICAgICAgICAtPl9fc2V0dXBfbXVsdGlwYXRoCiAgICAgICAgICAgICAgICAt
PmRtX2dldF9pbmZvCiAgICAgICAgICAgICAgICAgICAgLT5kbV90YXNrX3J1bgogICAgICAgICAg
ICAgICAgICAgICAgICAtPl9vcGVuX2NvbnRyb2wKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0+X29wZW5fYW5kX2Fzc2lnbl9jb250cm9sX2ZkCgpMaXhpYW9rZW5nCgpPbiAyMDIwLzcvOSAx
Njo1NCwgWmRlbmVrIEthYmVsYWMgd3JvdGU6Cj4gRG5lIDA5LiAwNy4gMjAgdiA5OjAyIGxpeGlh
b2tlbmcgbmFwc2FsKGEpOgo+PiBXaGVuIG9uZSBpc2NzaSBkZXZpY2UgbG9ncyBpbiBhbmQgbG9n
cyBvdXQgc2V2ZXJhbCB0aW1lcywgdGhlCj4+IG51bWJlciBvZiBmZCwgd2hpY2ggcG9pbnRzIHRv
ICcvZGV2L21hcHBlci9jb250cm9sJywgaW5jcmVhc2VzIGluCj4+IC9wcm9jLzxtdWx0aXBhdGhk
LXBpZD4vZmQgYXMgZm9sbG93cywKPj4gW3Jvb3RAbG9jYWxob3N0IGZkXSMgbGwgfCBncmVwIGNv
bnRyb2wKPiAKPj4gZGlmZiAtLWdpdCBhL2xpYmRtL2lvY3RsL2xpYmRtLWlmYWNlLmMgYi9saWJk
bS9pb2N0bC9saWJkbS1pZmFjZS5jCj4+IGluZGV4IDdhZDU0OWMuLjcxNjgzNjkgMTAwNjQ0Cj4+
IC0tLSBhL2xpYmRtL2lvY3RsL2xpYmRtLWlmYWNlLmMKPj4gKysrIGIvbGliZG0vaW9jdGwvbGli
ZG0taWZhY2UuYwo+PiBAQCAtMjMsNiArMjMsNyBAQAo+PiDCoCAjaW5jbHVkZSA8c3lzL2lvY3Rs
Lmg+Cj4+IMKgICNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgo+PiDCoCAjaW5jbHVkZSA8bGltaXRz
Lmg+Cj4+ICsjaW5jbHVkZSA8cHRocmVhZC5oPgo+Pgo+PiDCoCAjaWZkZWYgX19saW51eF9fCj4+
IMKgICPCoCBpbmNsdWRlICJsaWJkbS9taXNjL2tkZXZfdC5oIgo+PiBAQCAtODEsNiArODIsNyBA
QCBzdGF0aWMgZG1fYml0c2V0X3QgX2RtX2JpdHNldCA9IE5VTEw7Cj4+IMKgIHN0YXRpYyB1aW50
MzJfdCBfZG1fZGV2aWNlX21ham9yID0gMDsKPj4KPj4gwqAgc3RhdGljIGludCBfY29udHJvbF9m
ZCA9IC0xOwo+PiArc3RhdGljIHB0aHJlYWRfbXV0ZXhfdCBfY29udHJvbF9mZF9tdXRleCA9IFBU
SFJFQURfTVVURVhfSU5JVElBTElaRVI7Cj4+IMKgIHN0YXRpYyBpbnQgX2hvbGRfY29udHJvbF9m
ZF9vcGVuID0gMDsKPj4gwqAgc3RhdGljIGludCBfdmVyc2lvbl9jaGVja2VkID0gMDsKPj4gwqAg
c3RhdGljIGludCBfdmVyc2lvbl9vayA9IDE7Cj4+IEBAIC00MDQsMTAgKzQwNiwxOSBAQCBzdGF0
aWMgdm9pZCBfY2xvc2VfY29udHJvbF9mZCh2b2lkKQo+PiDCoCAjaWZkZWYgRE1fSU9DVExTCj4+
IMKgIHN0YXRpYyBpbnQgX29wZW5fYW5kX2Fzc2lnbl9jb250cm9sX2ZkKGNvbnN0IGNoYXIgKmNv
bnRyb2wpCj4+IMKgIHsKPj4gK8KgwqDCoCBwdGhyZWFkX211dGV4X2xvY2soJl9jb250cm9sX2Zk
X211dGV4KTsKPj4gKwo+PiArwqDCoMKgIGlmIChfY29udHJvbF9mZCAhPSAtMSkgewo+IAo+IAo+
IAo+IEhpCj4gCj4gbGliZG0gaXMgbm90IHB0aHJlYWQgYXdhcmUvc2FmZSBsaWJyYXJ5Lgo+IAo+
IFNvIHRoZSBmaXggbmVlZHMgdG8gaGFwcGVuIG9uIGxpYmRtIHVzZXItc2lkZSB0byBwcmV2ZW50
IHJhY2UgY2FsbCBvZiB0aGlzIGZ1bmN0aW9uLgo+IAo+IAo+IFpkZW5lawo+IAo+IAo+IC4KCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

