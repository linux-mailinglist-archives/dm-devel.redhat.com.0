Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE3518F95F
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 17:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584979889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KDFrdoQR49YoTphavAl7NwVFbk0M61dwOwaUgZZDLQY=;
	b=AG8mgT7d9KrXYgbe6ZAQcAnr18c4O/o3X0RJcyXiOkpdEXEiYVarpOCLl1il/gSFZ4Wzzj
	xmBH8/X4PmWAGyqEiVQxxGBVVWJ5kWA7hY4xk1eWrUM9eTC1yVyGO9elnk4ZmwYTcR9g32
	bMsjoXVA7iq3fSRgDudHybhbUxrLdhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-2YHiNmCGMxi-0OL9j_cxfg-1; Mon, 23 Mar 2020 12:11:27 -0400
X-MC-Unique: 2YHiNmCGMxi-0OL9j_cxfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C09BC100550E;
	Mon, 23 Mar 2020 16:11:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D747E324;
	Mon, 23 Mar 2020 16:11:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44A3686385;
	Mon, 23 Mar 2020 16:11:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NGAxbx005014 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 12:10:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C02910E51B0; Mon, 23 Mar 2020 16:10:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7805210E51AD
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 16:10:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AB098F7827
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 16:10:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-452-rxYbtcCZNvi943dCvUOzrw-1;
	Mon, 23 Mar 2020 12:10:54 -0400
X-MC-Unique: rxYbtcCZNvi943dCvUOzrw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 82BC5ADF8;
	Mon, 23 Mar 2020 16:10:52 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323151538.GA27573@redhat.com>
	<69ce4dd2-81d3-0ac6-933b-a1f781836597@suse.de>
	<20200323153944.GA27615@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <7e92a106-b072-126f-fda5-80a8d4abc296@suse.de>
Date: Mon, 23 Mar 2020 17:10:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323153944.GA27615@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NGAxbx005014
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC 0/2] dm-zoned: add cache device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yMy8yMCA0OjM5IFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMjMg
MjAyMCBhdCAxMToyNmFtIC0wNDAwLAo+IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPiB3
cm90ZToKPiAKPj4gT24gMy8yMy8yMCA0OjE1IFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4+PiBP
biBNb24sIE1hciAyMyAyMDIwIGF0IDExOjAzYW0gLTA0MDAsCj4+PiBIYW5uZXMgUmVpbmVja2Ug
PGhhcmVAc3VzZS5kZT4gd3JvdGU6Cj4+Pgo+Pj4+IEhpIERhbWllbiwKPj4+Pgo+Pj4+IGFzIG15
IG9yaWdpbmFsIHBsYW4gdG8gdXBncmFkZSBiY2FjaGUgdG8gd29yayBmb3IgU01SIGRldmljZXMK
Pj4+PiB0dXJuZWQgb3V0IHRvIGJlIG1vcmUgY29tcGxleCB0aGFuIGFudGljaXBhdGVkIEkgd2Vu
dCBmb3IgdGhlCj4+Pj4gc2ltcGxlciBhcHByb2FjaCBhbmQgYWRkZWQgYSAnY2FjaGUnIGRldmlj
ZSBmb3IgZG0tem9uZWQuCj4+Pj4gSXQgaXMgdXNpbmcgYSBub3JtYWwgZGV2aWNlIChlZyAnL2Rl
di9wbWVtMCcgOi0pLCBzcGxpdCBpdAo+Pj4+IGludG8gem9uZXMgb2YgdGhlIHNhbWUgc2l6ZSBv
ZiB0aGUgb3JpZ2luYWwgU01SIGRldmljZSwgYW5kCj4+Pj4gbWFrZXMgdGhvc2UgJ3ZpcnR1YWwn
IHpvbmVzIGF2aWFsYWJsZSB0byBkbS16b25lZCBpbiBhIHNpbWlsYXIKPj4+PiBtYW5uZXIgdGhh
biB0aGUgZXhpc3RpbmcgJ3JhbmRvbSB3cml0ZScgem9uZWQuCj4+Pj4KPj4+PiBUaGUgaW1wbGVt
ZW50YXRpb24gaXMgc3RpbGwgYSBiaXQgcm91Z2ggKG9uZSB3b3VsZCBuZWVkIHRvIGFkZAo+Pj4+
IG1ldGFkYXRhIHRvIHRoZSBjYWNoZSBkZXZpY2UsIHRvbyksIGJ1dCBzbyBmYXIgaXQgc2VlbXMg
dG8gd29yawo+Pj4+IHF1aXRlIHdlbGw7IHN0aWxsIHJ1bm5pbmcgYWZ0ZXIgY29weWluZyAzMDBH
QiBvZiBkYXRhIGJhY2sgYW5kIGZvcnRoLgo+Pj4+Cj4+Pj4gQXMgdXN1YWwsIGNvbW1lbnRzIGFu
ZCByZXZpZXdzIGFyZSB3ZWxjb21lLgo+Pj4KPj4+IE5vdCBzZWVpbmcgd2h5IHRoaXMgbmVlZHMg
dG8gYmUgc28gc3BlY2lhbGl6ZWQgKG5hdGl2ZWx5IGltcGxlbWVudGVkIGluCj4+PiBkbS16b25l
ZCkuICBEaWQgeW91IHRyeSBzdGFja2luZyBkbS13cml0ZWNhY2hlIG9uIGRtLXpvbmVkPwo+Pj4K
Pj4gZG0tem9uZWQgaXMgdXNpbmcgdGhlIHJhbmRvbS13cml0ZSB6b25lcyBpbnRlcm5hbGx5IHRv
IHN0YWdlIHdyaXRlcwo+PiB0byB0aGUgc2VxdWVudGlhbCB6b25lcywgc28gaW4gZWZmZWN0IGl0
IGFscmVhZHkgaGFzIGFuIGludGVybmFsCj4+IGNhY2hpbmcuCj4+IEFsbCB0aGlzIHBhdGNoIGRv
ZXMgaXMgdG8gdXNlIGEgZGlmZmVyZW50IGRldmljZSBmb3IgdGhlIGFscmVhZHkgcHJlc2VudAo+
PiBtZWNoYW5pc20uCj4+IFVzaW5nIGRtLXdyaXRlY2FjaGUgd291bGQgYmUgaWdub3JhbnQgb2Yg
dGhhdCBtZWNoYW5pc20sIGxlYWRpbmcgdG8KPj4gZG91YmxlIGNhY2hpbmcgYW5kIGRldHJpbWVu
dGFsIHJlc3VsdHMuCj4gCj4gSWYgZG0td3JpdGVjYWNoZSB3ZXJlIGVmZmVjdGl2ZSBhdCBzdWJt
aXR0aW5nIGxhcmdlciBJTyB0aGVuIGRtLXpvbmVkCj4gc2hvdWxkbid0IGJlIHJlc29ydGluZyB0
byBjYWNoaW5nIGluIHJhbmRvbS13cml0ZSB6b25lcyBhdCBhbGwgLS0gdGhhdAo+IGlzIGEgYmln
IGlmLCBzbyBub3Qgc2F5aW5nIGl0J2xsICJqdXN0IHdvcmsiLiAgQnV0IGlmIGJvdGggbGF5ZXJz
IGFyZQo+IHdvcmtpbmcgdGhlbiBpdCBzaG91bGQuCj4gCldlbGwsIGJ5IHRoZSBsb29rcyBvZiBp
dCBkbS13cml0ZWNhY2hlIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZSBwcm9ibGVtIApiY2FjaGUgaGFz
OyBpdCBhbGxvd3MgZm9yIGJsb2NrcyB1cCB0byA2NGsgc2VjdG9ycyB0byBiZSBzdWJtaXR0ZWQu
ClNhZGx5IGZvciBTTVIgZHJpdmVzIEkgd291bGQgbmVlZCB0byBzdWJtaXQgYmxvY2sgb2YgMjU2
TS4uLgpCdXQgYmVmb3JlIGRpc2N1c3NpbmcgYW55IGZ1cnRoZXIgSSdsbCBnaXZlIGl0IGEgZ28g
YW5kIHNlZSB3aGVyZSBJIGVuZCB1cC4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBS
ZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3Vz
ZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcK
SFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTD
tnJmZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

