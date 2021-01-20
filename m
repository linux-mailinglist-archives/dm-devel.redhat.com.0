Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE62FC7F3
	for <lists+dm-devel@lfdr.de>; Wed, 20 Jan 2021 03:31:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-m52APDhIMXK_FcnAYzwWiQ-1; Tue, 19 Jan 2021 21:31:45 -0500
X-MC-Unique: m52APDhIMXK_FcnAYzwWiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC4AD801817;
	Wed, 20 Jan 2021 02:31:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0EB722EE;
	Wed, 20 Jan 2021 02:31:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC54D180954D;
	Wed, 20 Jan 2021 02:31:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10K2VJMg001150 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 21:31:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ED8C22166AF6; Wed, 20 Jan 2021 02:31:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F302166AF4
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 02:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C410811E76
	for <dm-devel@redhat.com>; Wed, 20 Jan 2021 02:31:15 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-CganCrO8Mea-espxQXv-VA-1; Tue, 19 Jan 2021 21:31:13 -0500
X-MC-Unique: CganCrO8Mea-espxQXv-VA-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DL8cp6KYLzj9yc;
	Wed, 20 Jan 2021 10:30:02 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.498.0; Wed, 20 Jan 2021 10:30:59 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <063bbeeb-15aa-f7c0-b881-7526c3a2720c@huawei.com>
	<f86753b17cc7e85e7e0f7e711adec349323a7c5a.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <d8ba8118-ce98-249a-cafd-021f0c1831a5@huawei.com>
Date: Wed, 20 Jan 2021 10:30:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f86753b17cc7e85e7e0f7e711adec349323a7c5a.camel@suse.com>
X-Originating-IP: [10.174.178.113]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10K2VJMg001150
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>, lihaotian9@huawei.com
Subject: Re: [dm-devel] [QUESTION]: multipath device with wrong path lead to
	metadata err
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluOgogICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5LgoKCj4gdmVyaWZ5X3BhdGhzKCkg
d291bGQgZGV0ZWN0IHRoaXMuIFdlIGRvIGNhbGwgdmVyaWZ5X3BhdGhzKCkgaW4KPiBjb2FsZXNj
ZV9wYXRocygpIGJlZm9yZSBjYWxsaW5nIGRvbWFwKCksIGJ1dCBub3QgaW1tZWRpYXRlbHkgYmVm
b3JlLgo+IFBlcmhhcHMgd2Ugc2hvdWxkIG1vdmUgdGhlIHZlcmlmeV9wYXRocygpIGNhbGwgZG93
biB0byBpbW1lZGlhdGVseQo+IGJlZm9yZSB0aGUgZG9tYXAoKSBjYWxsLsKgVGhhdCB3b3VsZCBh
dCBsZWFzdCBtaW5pbWl6ZSB0aGUgdGltZSB3aW5kb3cKPiBmb3IgdGhpcyByYWNlLiBJdCdzIGhh
cmQgdG8gYXZvaWQgaXQgZW50aXJlbHkuIFRoZSB3YXkgbXVsdGlwYXRoZCBpcwo+IHdyaXR0ZW4s
IHRoZSB2ZWNzIGxvY2sgaXMgaGVsZCBhbGwgdGhlIHRpbWUgZHVyaW5nIGNvYWxlc2NlX3BhdGhz
KCksIAo+IGFuZCB0aHVzIG5vIHVldmVudHMgY2FuIGJlIHByb2Nlc3NlZC4gV2UgY291bGQgYWxz
byBjb25zaWRlciBjYWxsaW5nCj4gdmVyaWZ5X3BhdGhzKCkgYmVmb3JlICphbmQqIGFmdGVyIGRv
bWFwKCkuCgpDYW4gY2FsbGluZyB2ZXJpZnlfcGF0aHMoKSBiZWZvcmUgKmFuZCogYWZ0ZXIgZG9t
YXAoKSBkZWFsIHRoaXMgZW50aXJlbHk/Cgo+IFdhcyB0aGlzIGEgbWFwIGNyZWF0aW9uIG9yIGEg
bWFwIHJlbG9hZD8gV2FzIHRoZSBtYXAgcmVtb3ZlZCBhZnRlciB0aGUKPiBmYWlsdXJlPyBEbyB5
b3Ugb2JzZXJ2ZSB0aGUgbWVzc2FnZSAiaWdub3JpbmcgbWFwIiBvciAicmVtb3ZpbmcgbWFwIj8K
Pgo+IERvIHlvdSBvYnNlcnZlIGEgInJlbW92ZSIgdWV2ZW50IGZvciBzZGk/IAoKVGhpcyB3YXMg
YSBtYXAgcmVsb2FkIGJ1dCBzZGkgd2FzIG5vdCBpbiBvbGQgbWFwLiBUaGUgICJyZW1vdmluZyBt
YXAiCndhcyBvYnNlcnZlZC4gVGhlICJyZW1vdmUiIHVldmVudCBmb3Igc2RpIHdhcyBub3Qgb2Jz
ZXJ2ZWQgaGVyZS4KCj4gSSB3b25kZXIgaWYgeW91J2Qgc2VlIHRoZSBpc3N1ZSBhbHNvIGlmIHlv
dSBydW4gdGhlIHNhbWUgdGVzdCB3aXRob3V0Cj4gdGhlICJtdWx0aXBhdGggLUY7IG11bHRpcGF0
aCAtciIgbG9vcCwgb3Igd2l0aCBqdXN0IG9uZS4gT2ssIG9uZQo+IG11bHRpcGF0aF9xdWVyeSgp
IGxvb3Agc2ltdWxhdGVzIGFuIGFkbWluIHdvcmtpbmcgb24gdGhlIHN5c3RlbSwgYnV0IDIKPiBw
YXJhbGxlbCBsb29wcyAtIDIgYWRtaW5zIHdvcmtpbmcgaW4gcGFyYWxsZWwsIHBsdXMgdGhlIGlu
dGVuc2l2ZQo+IHNlcXVlbmNlIG9mIGFjdGlvbnMgZG9uZSBpbiBtdWx0aXBhdGhkX3F1ZXJ5IGF0
IHRoZSBzYW1lIHRpbWU/IFRoZQo+IHJlcGVhdGVkICJtdWx0aXBhdGggLXIiIGNhbGxzIGFuZCBt
dWx0aXBhdGhkIGNvbW1hbmRzIHdpbGwgY2F1c2UKPiBtdWx0aXBhdGhkIHRvIHNwZW5kIGEgbG90
IG9mIHRpbWUgaW4gcmVjb25maWd1cmUoKSBhbmQgaW4gY2xpXyogY2FsbHMKPiBob2xkaW5nIHRo
ZSB2ZWNzIGxvY2ssIHdoaWNoIG1ha2VzIGl0IGxpa2VseSB0aGF0IHVldmVudHMgYXJlIG1pc3Nl
ZCBvcgo+IHByb2Nlc3NlZCBsYXRlLgoKQXMgeW91IHNhaWQsIHRoZXJlIHdlcmUgbG90cyBvZiBj
bGlfKiBjYWxscyBidXQgbm8gdWV2ZW50IHdoZW4gZXJyb3IKY2F1c2VkLiBBbmQgYWZ0ZXIgZmlu
aXNoaW5nIHRoZW0sIGh1bmRyZWRzIG9mIHVldmVudCB3aWxsIGJlIGZvdW5kIChmb3IKZXhhbXBs
ZSAsIkZvcndhcmRpbmcgMjAxIHVldmVudHMiIGluIGxvZykuCgo+IERvbid0IGdldCBtZSB3cm9u
ZywgSSBkb24ndCBhcmd1ZSBhZ2FpbnN0IHRvdWdoIHRlc3RpbmcuIEJ1dCB3ZSBzaG91bGQKPiBi
ZSBhd2FyZSB0aGF0IHRoZXJlIGFyZSBhbHdheXMgdGltZSBpbnRlcnZhbHMgZHVyaW5nIHdoaWNo
IG11bHRpcGF0aGQncwo+IHBpY3R1cmUgb2YgdGhlIHByZXNlbnQgZGV2aWNlcyBpcyBkaWZmZXJl
bnQgZnJvbSB3aGF0IHRoZSBrZXJuZWwgc2Vlcy4KCldoYXQgeW91IHNhaWQgaXMgdmVyeSByZWFz
b25hYmxlLiBXaGVuIHRoaXMgcHJvYmxlbSB3YXMgZm91bmQsIEkgdGhpbmsKaXQgaXMgZGlmZmlj
dWx0IHRvIHNvbHZlIHRoYXQgZW50aXJlbHksIHdoaWxlIGl0IGlzIGhhcmQgdG8gaGFwcGVuLiBX
ZWxsLApJIHdpbGwgZGlzY3VzcyB0aGUgcmF0aW9uYWxpdHkgb2YgdGVzdCBzY3JpcHRzIHdpdGgg
dGVzdGVycy4KCj4gVGhlcmUncyBkZWZpbml0ZWx5IHJvb20gZm9yIGltcHJvdmVtZW50IGluIG11
bHRpcGF0aGQgd3J0IGxvY2tpbmcgYW5kCj4gZXZlbnQgcHJvY2Vzc2luZyBpbiBnZW5lcmFsLCBi
dXQgdGhhdCdzIGEgQklHIHBpZWNlIG9mIHdvcmsuCgpUaGFua3MgYWdhaW4hClJlZ2FyZHMKTGl4
aWFva2VuZwoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

