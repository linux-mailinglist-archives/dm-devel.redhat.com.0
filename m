Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3EB17F790
	for <lists+dm-devel@lfdr.de>; Tue, 10 Mar 2020 13:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583843979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ovsa6ExyoRMIzpKNZGbdcjEQxFT36LCjMJtpmKSto0A=;
	b=hWVhDgm2/wtLLeOLOYZWU1T+dG0KqvKDsvgt6/ChHB19Q8Ccl5qP8zOFvAMllyQdUsW0m8
	iz/NVBuoDEHji4TEoMgDBnZ6kScnmdODbxjrgP/qPSbHzVM+dc4KRgG5KPei8vZi9biFbY
	PfTjK+MrY63B050wptu/SzrVKLpZw6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-kLIisknlP36mPLlDWE7OEg-1; Tue, 10 Mar 2020 08:39:37 -0400
X-MC-Unique: kLIisknlP36mPLlDWE7OEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07620107ACC9;
	Tue, 10 Mar 2020 12:39:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4107E90F5B;
	Tue, 10 Mar 2020 12:39:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 274941832DEA;
	Tue, 10 Mar 2020 12:39:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ACdEwU027974 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 08:39:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EC9160304; Tue, 10 Mar 2020 12:39:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C828D570;
	Tue, 10 Mar 2020 12:39:10 +0000 (UTC)
To: dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>
References: <5e49305bc15869c58edea0e6d815a546b9ee2c66.1583792345.git.heinzm@redhat.com>
	<BYAPR04MB5816244DDF2E4EE2F1FAD3A0E7FE0@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <f49d23b2-6b2b-1793-32e4-b3527a91922f@redhat.com>
Date: Tue, 10 Mar 2020 13:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816244DDF2E4EE2F1FAD3A0E7FE0@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v4] dm ebs: new block size emulating target
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

T24gMy85LzIwIDExOjQ0IFBNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzAzLzEw
IDc6MjYsIGhlaW56bUByZWRoYXQuY29tIHdyb3RlOgo+PiBGcm9tOiBIZWlueiBNYXVlbHNoYWdl
biA8aGVpbnptQHJlZGhhdC5jb20+Cj4+Cj4+IGRtIGViczogbmV3IGJsb2NrIHNpemUgZW11bGF0
aW5nIHRhcmdldAo+Pgo+PiBUaGlzIG5ldyB0YXJnZXQgaXMgc2ltaWxhciB0byB0aGUgbGluZWFy
IHRhcmdldCBleGNlcHQgdGhhdCBpdCBlbXVsYXRlcwo+PiBhIHNtYWxsZXIgbG9naWNhbCBibG9j
ayBzaXplIG9uIGRldmljZXMgd2l0aCBsYXJnZXIgb25lcy4gIEl0J3MgbWFpbgo+PiBwdXJwb3Nl
IGlzIHRvIGVtdWxhdGUgNTEyIGJ5dGUgc2VjdG9ycyBvbiA0SyBuYXRpdmUgZGlza3MgKGkuZS4g
NTEyZSkuCj4+Cj4+IFNlZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIv
ZG0tZWJzLnJzdCBmb3IgZGV0YWlscy4KPj4KPj4gQ2hhbmdlcyB2ZXJzdXMgdmVyc2lvbiAzIHNl
bnQgb24gMi8xOS8yMDIwOgo+Pgo+PiAtIGRvY3VtZW50ICdzdHJ1Y3QgZWJzX2MnIGFuZCByZW5h
bWUgaXRzIGJsb2Nrc2l6ZSBhbmQgYmxvY2sgc2hpZnQgZmllbGRzCj4+IC0gaW5saW5lIGZ1bmN0
aW9ucyAoZS5nLiBfX25yX2Jsb2NrcygpKQo+PiAtIGFkanVzdCBfX2Vic19yd19idmVjKCkgZnVu
Y3Rpb24gaGVhZGVyIGZvcm1hdAo+PiAtIGFjY2VzcyBwYWdlX2FkZHJlc3MoKSBhZnRlciBidl9w
YWdlIGNoZWNrOyB0eXBvCj4+IC0gYXZvaWQgc3VwZXJmbHVvdXMgY2hlY2sgZGVmaW5pbmcgYmlf
c3RhdHVzIGluIF9fZWJzX3Byb2Nlc3NfYmlvcygpCj4+IC0gY29ycmVjdCBpbmRlbnRhdGlvbgo+
PiAtIGF2b2lkIG9wX2lzX2ZsdXNoKCkgY2F1c2luZyBSRVFfRlVBIGJpb3MgdG8gYmUKPj4gICAg
cmVtYXBwZWQgaGVuY2Ugbm90IHByb2Nlc3NlZCBieSB0aGUgdGFyZ2V0Cj4+IC0gY2FsbCBmbHVz
aF9kY2FjaGVfcGFnZSgpIGNvcnJlbGF0ZWQgd2l0aCBtZW1jcHkoKSB0byBlbnN1cmUKPj4gICAg
RC1jYWNoZSBhbGlhc2luZyBhcyBvZiBjYWNoZSBhbmQgVExCIGZsdXNoaW5nIGd1aWRlbGluZXMK
Pj4gLSBjb21tZW50cwo+IEdlbmVyYWxseSwgdGhlIGNoYW5nZSBsb2cgaXMgbm90IGFkZGVkIGFz
IHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZAo+IG1lbnRpb25lZCBhZnRlciB0aGUgIi0t
LSIgYW5kIGFsbCBjaGFuZ2UgbG9ncyAiZnJvbSB2MSIsICJmcm9tIHYyIiBldGMga2VwdCBzbwo+
IHRoYXQgZXZlcnlib2R5IGNhbiBzZWUgdGhlIHByb2dyZXNzaW9uLgoKCkFzIG9mIHRoZSBrZXJu
ZWwgcGF0Y2ggc3VibWlzc2lvbiBndWlkZWxpbmVzIGl0IHNob3VsZCBiZSBwYXJ0IG9mOgoKJ0Rl
c2NyaWJlIHlvdXIgY2hhbmdlcyBpbiBpbXBlcmF0aXZlIG1vb2QsIGUuZy4g4oCcbWFrZSB4eXp6
eSBkbyBmcm90euKAnSAKaW5zdGVhZCBvZiDigJxbVGhpcyBwYXRjaF0gbWFrZXMgeHl6enkgZG8g
ZnJvdHrigJ0gb3Ig4oCcW0ldIGNoYW5nZWQgeHl6enkgdG8gCmRvIGZyb3R64oCdLCBhcyBpZiB5
b3UgYXJlIGdpdmluZyBvcmRlcnMgdG8gdGhlIGNvZGViYXNlIHRvIGNoYW5nZSBpdHMgCmJlaGF2
aW91ci4nCgpUaGUgbGltaXRhdGlvbiB0byB0aGUgdjMgLT4gdjQgY2hhbmdlcyB3YXMgbmVnb3Rp
YXRlZCB3aXRoIE1pa2UuCkknbGwga2VlcCBpdCBhcyBpcyB1bnRpbCBmdXJ0aGVyIGRlY2lzaW9u
LgoKCj4+IFJldmlld2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8RGFtaWVuTGVNb2FsQHdkYy5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW56IE1hdWVsc2hhZ2VuIDxoZWluem1AcmVkaGF0LmNvbT4K
Pj4gLS0tCj4+ICAgLi4uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tZWJzLnJzdCAgICAg
IHwgIDUxICsrCj4+ICAgZHJpdmVycy9tZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA4ICsKPj4gICBkcml2ZXJzL21kL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKwo+PiAgIGRyaXZlcnMvbWQvZG0tZWJzLXRhcmdldC5jICAgICAgICAgICAg
ICAgICAgICB8IDQzOSArKysrKysrKysrKysrKysrKysKPj4gICA0IGZpbGVzIGNoYW5nZWQsIDUw
MCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9kbS1lYnMucnN0Cj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWQvZG0tZWJzLXRhcmdldC5jCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tZWJzLnJzdCBiL0RvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9kbS1lYnMucnN0Cj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOWU3YWJkM2UwYWUxCj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL2RtLWVicy5y
c3QKPj4gQEAgLTAsMCArMSw1MSBAQAo+PiArPT09PT09Cj4+ICtkbS1lYnMKPj4gKz09PT09PQo+
PiArCj4+ICsKPj4gK1RoaXMgdGFyZ2V0IGlzIHNpbWlsYXIgdG8gdGhlIGxpbmVhciB0YXJnZXQs
IGV4Y2VwdCB0aGF0IGl0IGVtdWxhdGVzCj4+ICthIHNtYWxsZXIgbG9naWNhbCBibG9jayBzaXpl
IG9uIGRldmljZXMgd2l0aCBsYXJnZXIgb25lcy4gIEl0cyBtYWluCj4+ICtwdXJwb3NlIGlzIHRv
IHByb3ZpZGUgZW11bGF0aW9uIG9mIDUxMiBieXRlIHNlY3RvcnMgb24gZGV2aWNlcwo+PiArdGhh
dCBkbyBub3QgcHJvdmlkZSB0aGlzIGVtdWxhdGlvbiAoaS5lLiA0SyBuYXRpdmUgZGlza3MpLgo+
PiArCj4+ICtTdXBwb3J0ZWQgZW11bGF0ZWQgbG9naWNhbCBibG9jayBzaXplcyA1MTIsIDEwMjQs
IDIwNDggYW5kIDQwOTYuCj4gTml0OiB0aGVyZSBpcyBubyB2ZXJiIGluIHRoaXMgc2VudGVuY2Uu
CgoKTml0OiBjb2xvbiBtaXNzaW5nIDspCgpUaGFua3MsCkhlaW56CgoKPgo+PiArCj4+ICtVbmRl
cmx5aW5nIGJsb2NrIHNpemUgY2FuIGJlIHNldCB0byA+IDRLIHRvIHRlc3QgYnVmZmVyaW5nIGxh
cmdlciB1bml0cy4KPj4gKwo+PiArCj4+ICtUYWJsZSBwYXJhbWV0ZXJzCj4+ICstLS0tLS0tLS0t
LS0tLS0tCj4+ICsgIDxkZXYgcGF0aD4gPG9mZnNldD4gPGVtdWxhdGVkIHNlY3RvcnM+IFs8dW5k
ZXJseWluZyBzZWN0b3JzPl0KPj4gKwo+PiArTWFuZGF0b3J5IHBhcmFtZXRlcnM6Cj4+ICsKPj4g
KyAgICA8ZGV2IHBhdGg+Ogo+PiArICAgICAgICBGdWxsIHBhdGhuYW1lIHRvIHRoZSB1bmRlcmx5
aW5nIGJsb2NrLWRldmljZSwKPj4gKyAgICAgICAgb3IgYSAibWFqb3I6bWlub3IiIGRldmljZS1u
dW1iZXIuCj4+ICsgICAgPG9mZnNldD46Cj4+ICsgICAgICAgIFN0YXJ0aW5nIHNlY3RvciB3aXRo
aW4gdGhlIGRldmljZTsKPj4gKyAgICAgICAgaGFzIHRvIGJlIGEgbXVsdGlwbGUgb2YgPGVtdWxh
dGVkIHNlY3RvcnM+Lgo+PiArICAgIDxlbXVsYXRlZCBzZWN0b3JzPjoKPj4gKyAgICAgICAgTnVt
YmVyIG9mIHNlY3RvcnMgZGVmaW5pbmcgdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSB0byBiZSBlbXVs
YXRlZDsKPj4gKyAgICAgICAgMSwgMiwgNCwgOCBzZWN0b3JzIG9mIDUxMiBieXRlcyBzdXBwb3J0
ZWQuCj4+ICsKPj4gK09wdGlvbmFsIHBhcmFtZXRlcjoKPj4gKwo+PiArICAgIDx1bmRlcnlsaW5n
IHNlY3RvcnM+Ogo+PiArICAgICAgICBOdW1iZXIgb2Ygc2VjdG9ycyBkZWZpbmluZyB0aGUgbG9n
aWNhbCBibG9jayBzaXplIG9mIDxkZXYgcGF0aD4uCj4+ICsgICAgICAgIDJeTiBzdXBwb3J0ZWQs
IGUuZy4gOCA9IGVtdWxhdGUgOCBzZWN0b3JzIG9mIDUxMiBieXRlcyA9IDRLaUIuCj4+ICsgICAg
ICAgIElmIG5vdCBwcm92aWRlZCwgdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBvZiA8ZGV2IHBhdGg+
IHdpbGwgYmUgdXNlZC4KPj4gKwo+PiArCj4+ICtFeGFtcGxlczoKPj4gKwo+PiArRW11bGF0ZSAx
IHNlY3RvciA9IDUxMiBieXRlcyBsb2dpY2FsIGJsb2NrIHNpemUgb24gL2Rldi9zZGEgc3RhcnRp
bmcgYXQKPj4gK29mZnNldCAxMDI0IHNlY3RvcnMgd2l0aCB1bmRlcmx5aW5nIGRldmljZXMgYmxv
Y2sgc2l6ZSBhdXRvbWF0aWNhbGx5IHNldDoKPj4gKwo+PiArZWJzIC9kZXYvc2RhIDEwMjQgMQo+
PiArCj4+ICtFbXVsYXRlIDIgc2VjdG9yID0gMUtpQiBsb2dpY2FsIGJsb2NrIHNpemUgb24gL2Rl
di9zZGEgc3RhcnRpbmcgYXQKPj4gK29mZnNldCAxMjggc2VjdG9ycywgZW5mb3JjZSAyS2lCIHVu
ZGVybHlpbmcgZGV2aWNlIGJsb2NrIHNpemUuCj4+ICtUaGlzIHByZXN1bWVzIDJLaUIgbG9naWNh
bCBibG9ja3NpemUgb24gL2Rldi9zZGEgb3IgbGVzcyB0byB3b3JrOgo+PiArCj4+ICtlYnMgL2Rl
di9zZGEgMTI4IDIgNAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9LY29uZmlnIGIvZHJpdmVy
cy9tZC9LY29uZmlnCj4+IGluZGV4IGQ2ZDVhYjIzYzA4OC4uMzkyOTc0YTI5OTlkIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL21kL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9tZC9LY29uZmlnCj4+
IEBAIC0zMzYsNiArMzM2LDE0IEBAIGNvbmZpZyBETV9XUklURUNBQ0hFCj4+ICAgCSAgIFRoZSB3
cml0ZWNhY2hlIHRhcmdldCBkb2Vzbid0IGNhY2hlIHJlYWRzIGJlY2F1c2UgcmVhZHMgYXJlIHN1
cHBvc2VkCj4+ICAgCSAgIHRvIGJlIGNhY2hlZCBpbiBzdGFuZGFyZCBSQU0uCj4+ICAgCj4+ICtj
b25maWcgRE1fRUJTCj4+ICsgICAgICAgdHJpc3RhdGUgIkVtdWxhdGVkIGJsb2NrIHNpemUgdGFy
Z2V0IChFWFBFUklNRU5UQUwpIgo+PiArICAgICAgIGRlcGVuZHMgb24gQkxLX0RFVl9ETQo+PiAr
ICAgICAgIGRlZmF1bHQgbgo+PiArICAgICAgIC0tLWhlbHAtLS0KPj4gKwkgZG0tZWJzIGVtdWxh
dGVzIHNtYWxsZXIgbG9naWNhbCBibG9jayBzaXplIG9uIGJhY2tpbmcgZGV2aWNlcwo+PiArCSB3
aXRoIGxhcmdlciBvbmVzIChlLmcuIDUxMiBieXRlIHNlY3RvcnMgb24gNEsgbmF0aXZlIGRpc2tz
KS4KPj4gKwo+PiAgIGNvbmZpZyBETV9FUkEKPj4gICAgICAgICAgdHJpc3RhdGUgIkVyYSB0YXJn
ZXQgKEVYUEVSSU1FTlRBTCkiCj4+ICAgICAgICAgIGRlcGVuZHMgb24gQkxLX0RFVl9ETQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9NYWtlZmlsZSBiL2RyaXZlcnMvbWQvTWFrZWZpbGUKPj4g
aW5kZXggZDkxYTdlZGNkMmFiLi45YTJkNjczZjk0YmMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bWQvTWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9tZC9NYWtlZmlsZQo+PiBAQCAtMTcsNiArMTcs
NyBAQCBkbS10aGluLXBvb2wteQkrPSBkbS10aGluLm8gZG0tdGhpbi1tZXRhZGF0YS5vCj4+ICAg
ZG0tY2FjaGUteQkrPSBkbS1jYWNoZS10YXJnZXQubyBkbS1jYWNoZS1tZXRhZGF0YS5vIGRtLWNh
Y2hlLXBvbGljeS5vIFwKPj4gICAJCSAgICBkbS1jYWNoZS1iYWNrZ3JvdW5kLXRyYWNrZXIubwo+
PiAgIGRtLWNhY2hlLXNtcS15ICAgKz0gZG0tY2FjaGUtcG9saWN5LXNtcS5vCj4+ICtkbS1lYnMt
eQkrPSBkbS1lYnMtdGFyZ2V0Lm8KPj4gICBkbS1lcmEteQkrPSBkbS1lcmEtdGFyZ2V0Lm8KPj4g
ICBkbS1jbG9uZS15CSs9IGRtLWNsb25lLXRhcmdldC5vIGRtLWNsb25lLW1ldGFkYXRhLm8KPj4g
ICBkbS12ZXJpdHkteQkrPSBkbS12ZXJpdHktdGFyZ2V0Lm8KPj4gQEAgLTY1LDYgKzY2LDcgQEAg
b2JqLSQoQ09ORklHX0RNX1RISU5fUFJPVklTSU9OSU5HKQkrPSBkbS10aGluLXBvb2wubwo+PiAg
IG9iai0kKENPTkZJR19ETV9WRVJJVFkpCQkrPSBkbS12ZXJpdHkubwo+PiAgIG9iai0kKENPTkZJ
R19ETV9DQUNIRSkJCSs9IGRtLWNhY2hlLm8KPj4gICBvYmotJChDT05GSUdfRE1fQ0FDSEVfU01R
KQkrPSBkbS1jYWNoZS1zbXEubwo+PiArb2JqLSQoQ09ORklHX0RNX0VCUykJCSs9IGRtLWVicy5v
Cj4+ICAgb2JqLSQoQ09ORklHX0RNX0VSQSkJCSs9IGRtLWVyYS5vCj4+ICAgb2JqLSQoQ09ORklH
X0RNX0NMT05FKQkJKz0gZG0tY2xvbmUubwo+PiAgIG9iai0kKENPTkZJR19ETV9MT0dfV1JJVEVT
KQkrPSBkbS1sb2ctd3JpdGVzLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0tZWJzLXRh
cmdldC5jIGIvZHJpdmVycy9tZC9kbS1lYnMtdGFyZ2V0LmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMjMzNTQyMTBkZDIKPj4gLS0tIC9kZXYvbnVsbAo+
PiArKysgYi9kcml2ZXJzL21kL2RtLWVicy10YXJnZXQuYwo+PiBAQCAtMCwwICsxLDQzOSBAQAo+
PiArLyoKPj4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBSZWQgSGF0IEdtYkgKPj4gKyAqCj4+ICsg
KiBUaGlzIGZpbGUgaXMgcmVsZWFzZWQgdW5kZXIgdGhlIEdQTC4KPiBQbGVhc2UgdXMgYSBTUERY
IGhlYWRlciBvbiB0b3Agb2YgdGhlIGZpbGUgaW5zdGVhZCBvZiB0aGlzIHNlbnRlbmNlLgo+IEUu
Zy4KPgo+IC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4KPiBhcyB0aGUgZmls
ZSBmaXJzdCBsaW5lLgo+Cj4+ICsgKgo+PiArICogRGV2aWNlLW1hcHBlciB0YXJnZXQgdG8gZW11
bGF0ZSBzbWFsbGVyIGxvZ2ljYWwgYmxvY2sKPj4gKyAqIHNpemUgb24gYmFja2luZyBkZXZpY2Vz
IGV4cG9zaW5nIChuYXRpdmVseSkgbGFyZ2VyIG9uZXMuCj4+ICsgKgo+PiArICogRS5nLiA1MTIg
Ynl0ZSBzZWN0b3IgZW11bGF0aW9uIG9uIDRLIG5hdGl2ZSBkaXNrcy4KPj4gKyAqLwo+PiArCj4+
ICsjaW5jbHVkZSAiZG0uaCIKPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC93b3JrcXVldWUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kbS1idWZpby5oPgo+
PiArCj4+ICsjZGVmaW5lIERNX01TR19QUkVGSVggImVicyIKPj4gKwo+PiArc3RhdGljIHZvaWQg
ZWJzX2R0cihzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSk7Cj4+ICsKPj4gKy8qIEVtdWxhdGVkIGJsb2Nr
IHNpemUgY29udGV4dC4gKi8KPj4gK3N0cnVjdCBlYnNfYyB7Cj4+ICsJc3RydWN0IGRtX2RldiAq
ZGV2OwkJLyogVW5kZXJseWluZyBkZXZpY2UgdG8gZW11bGF0ZSBibG9jayBzaXplIG9uLiAqLwo+
PiArCXN0cnVjdCBkbV9idWZpb19jbGllbnQgKmJ1ZmlvOwkvKiBVc2UgZG0tYnVmaW8gZm9yIHJl
YWQgYW5kIHJlYWQtbW9kaWZ5LXdyaXRlIHByb2Nlc3NpbmcuICovCj4+ICsJc3RydWN0IHdvcmtx
dWV1ZV9zdHJ1Y3QgKndxOwkvKiBXb3JrcXVldWUgZm9yIF4gcHJvY2Vzc2luZyBvZiBiaW9zLiAq
Lwo+PiArCXN0cnVjdCB3b3JrX3N0cnVjdCB3czsJCS8qIFdvcmsgaXRlbSB1c2VkIGZvciBeLiAq
Lwo+PiArCXN0cnVjdCBiaW9fbGlzdCBiaW9zX2luOwkvKiBXb3JrZXIgYmlvcyBpbnB1dCBsaXN0
LiAqLwo+PiArCXNwaW5sb2NrX3QgbG9jazsJCS8qIEd1YXJkIGJpb3MgaW5wdXQgbGlzdCBhYm92
ZS4gKi8KPj4gKwlzZWN0b3JfdCBzdGFydDsJCQkvKiA8c3RhcnQ+IHRhYmxlIGxpbmUgYXJndW1l
bnQsIHNlZSBlYnNfY3RyIGJlbG93LiAqLwo+PiArCXVuc2lnbmVkIGludCBlX2JzOwkJLyogRW11
bGF0ZWQgYmxvY2sgc2l6ZSBpbiBzZWN0b3JzIGV4cG9zZWQgdG8gdXBwZXIgbGF5ZXIuICovCj4+
ICsJdW5zaWduZWQgaW50IHVfYnM7CQkvKiBVbmRlcmx5aW5nIGJsb2NrIHNpemUgaW4gc2VjdG9y
cyByZXRyaWV2ZCBmcm9tL3NldCBvbiBsb3dlciBsYXllciBkZXZpY2UuICovCj4+ICsJdW5zaWdu
ZWQgY2hhciBibG9ja19zaGlmdDsJLyogYml0c2hpZnQgc2VjdG9ycyAtPiBibG9ja3MgdXNlZCBp
biBkbS1idWZpbyBBUEkuICovCj4+ICsJYm9vbCB1X2JzX3NldDoxOwkJLyogRmxhZyB0byBpbmRp
Y2F0ZSB1bmRlcmx5aW5nIGJsb2NrIHNpemUgaXMgc2V0IG9uIHRhYmxlIGxpbmUuICovCj4+ICt9
Owo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHNlY3Rvcl90IF9fc2VjdG9yX3RvX2Jsb2NrKHN0cnVj
dCBlYnNfYyAqZWMsIHNlY3Rvcl90IHNlY3RvcikKPj4gK3sKPj4gKwlyZXR1cm4gc2VjdG9yID4+
IGVjLT5ibG9ja19zaGlmdDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSBzZWN0b3JfdCBf
X2Jsb2NrX21vZChzZWN0b3JfdCBzZWN0b3IsIHVuc2lnbmVkIGludCBicykKPj4gK3sKPj4gKwly
ZXR1cm4gc2VjdG9yICYgKGJzIC0gMSk7Cj4+ICt9Cj4+ICsKPj4gKy8qIFJldHVybiBudW1iZXIg
b2YgYmxvY2tzIGZvciBhIGJpbyBhY2NvdW50aW5nIGZvciBtaXNhbGlnbmVtZW50IG9mIHN0YXJ0
IGFuZCBlbmQgc2VjdG9ycy4gKi8KPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IF9fbnJf
YmxvY2tzKHN0cnVjdCBlYnNfYyAqZWMsIHN0cnVjdCBiaW8gKmJpbykKPj4gK3sKPj4gKwlzZWN0
b3JfdCBlbmRfc2VjdG9yID0gX19ibG9ja19tb2QoYmlvLT5iaV9pdGVyLmJpX3NlY3RvciwgZWMt
PnVfYnMpICsgYmlvX3NlY3RvcnMoYmlvKTsKPj4gKwo+PiArCXJldHVybiBfX3NlY3Rvcl90b19i
bG9jayhlYywgZW5kX3NlY3RvcikgKyAoX19ibG9ja19tb2QoZW5kX3NlY3RvciwgZWMtPnVfYnMp
ID8gMSA6IDApOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgX19lYnNfY2hlY2tf
YnModW5zaWduZWQgaW50IGJzKQo+PiArewo+PiArCXJldHVybiBicyAmJiBpc19wb3dlcl9vZl8y
KGJzKTsKPj4gK30KPj4gKwo+PiArLyoKPj4gKyAqIFJFQUQvV1JJVEU6Cj4+ICsgKgo+PiArICog
Y29weSBibG9ja3MgYmV0d2VlbiBidWZpbyBibG9ja3MgYW5kIGJpbyB2ZWN0b3IncyAocGFydGlh
bC9vdmVybGFwcGluZykgcGFnZXMuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgX19lYnNfcndfYnZl
YyhzdHJ1Y3QgZWJzX2MgKmVjLCBpbnQgcncsIHN0cnVjdCBiaW9fdmVjICpidiwgc3RydWN0IGJ2
ZWNfaXRlciAqaXRlcikKPj4gK3sKPj4gKwlpbnQgciA9IDA7Cj4+ICsJdW5zaWduZWQgY2hhciAq
YmEsICpwYTsKPj4gKwl1bnNpZ25lZCBpbnQgY3VyX2xlbjsKPj4gKwl1bnNpZ25lZCBpbnQgYnZf
bGVuID0gYnYtPmJ2X2xlbjsKPj4gKwl1bnNpZ25lZCBpbnQgYnVmX29mZiA9IHRvX2J5dGVzKF9f
YmxvY2tfbW9kKGl0ZXItPmJpX3NlY3RvciwgZWMtPnVfYnMpKTsKPj4gKwlzZWN0b3JfdCBibG9j
ayA9IF9fc2VjdG9yX3RvX2Jsb2NrKGVjLCBpdGVyLT5iaV9zZWN0b3IpOwo+PiArCXN0cnVjdCBk
bV9idWZmZXIgKmI7Cj4+ICsKPj4gKwlpZiAodW5saWtlbHkoIWJ2LT5idl9wYWdlIHx8ICFidl9s
ZW4pKQo+PiArCQlyZXR1cm4gLUVJTzsKPj4gKwo+PiArCXBhID0gcGFnZV9hZGRyZXNzKGJ2LT5i
dl9wYWdlKSArIGJ2LT5idl9vZmZzZXQ7Cj4+ICsKPj4gKwkvKiBIYW5kbGUgb3ZlcmxhcHBpbmcg
cGFnZSA8LT4gYmxvY2tzICovCj4+ICsJd2hpbGUgKGJ2X2xlbikgewo+PiArCQljdXJfbGVuID0g
bWluKGRtX2J1ZmlvX2dldF9ibG9ja19zaXplKGVjLT5idWZpbykgLSBidWZfb2ZmLCBidl9sZW4p
Owo+PiArCj4+ICsJCS8qIEF2b2lkIHJlYWRpbmcgZm9yIHdyaXRlcyBpbiBjYXNlIGJpbyB2ZWN0
b3IncyBwYWdlIG92ZXJ3cml0ZXMgYmxvY2sgY29tcGxldGVseS4gKi8KPj4gKwkJaWYgKHJ3ID09
IFJFQUQgfHwgYnVmX29mZiB8fCBidl9sZW4gPCBkbV9idWZpb19nZXRfYmxvY2tfc2l6ZShlYy0+
YnVmaW8pKQo+PiArCQkJYmEgPSBkbV9idWZpb19yZWFkKGVjLT5idWZpbywgYmxvY2ssICZiKTsK
Pj4gKwkJZWxzZQo+PiArCQkJYmEgPSBkbV9idWZpb19uZXcoZWMtPmJ1ZmlvLCBibG9jaywgJmIp
Owo+PiArCj4+ICsJCWlmICh1bmxpa2VseShJU19FUlIoYmEpKSkKPj4gKwkJCXIgPSBQVFJfRVJS
KGJhKTsgLyogQ2Fycnkgb24gd2l0aCBuZXh0IGJ1ZmZlciBpZiBhbnkgdG8gSS9PIGFsbCBwb3Nz
aWJsZSBkYXRhIGJ1dCByZXR1cm4gZXJyb3IuICovCj4+ICsJCWVsc2Ugewo+PiArCQkJLyogQ29w
eSBkYXRhIHRvL2Zyb20gYmlvIHRvIGJ1ZmZlciBpZiByZWFkL25ldyB3YXMgc3VjY2Vzc2Z1bCBh
Ym92ZS4gKi8KPj4gKwkJCWJhICs9IGJ1Zl9vZmY7Cj4+ICsJCQlpZiAocncgPT0gUkVBRCkgewo+
PiArCQkJCW1lbWNweShwYSwgYmEsIGN1cl9sZW4pOwo+PiArCQkJCWZsdXNoX2RjYWNoZV9wYWdl
KGJ2LT5idl9wYWdlKTsKPj4gKwkJCX0gZWxzZSB7Cj4+ICsJCQkJZmx1c2hfZGNhY2hlX3BhZ2Uo
YnYtPmJ2X3BhZ2UpOwo+PiArCQkJCW1lbWNweShiYSwgcGEsIGN1cl9sZW4pOwo+PiArCQkJCWRt
X2J1ZmlvX21hcmtfcGFydGlhbF9idWZmZXJfZGlydHkoYiwgYnVmX29mZiwgYnVmX29mZiArIGN1
cl9sZW4pOwo+PiArCQkJfQo+PiArCj4+ICsJCQlkbV9idWZpb19yZWxlYXNlKGIpOwo+PiArCQl9
Cj4+ICsKPj4gKwkJcGEgKz0gY3VyX2xlbjsKPj4gKwkJYnZfbGVuIC09IGN1cl9sZW47Cj4+ICsJ
CWJ1Zl9vZmYgPSAwOwo+PiArCQlibG9jaysrOwo+PiArCX0KPj4gKwo+PiArCXJldHVybiByOwo+
PiArfQo+PiArCj4+ICsvKiBSRUFEL1dSSVRFOiBpdGVyYXRlIGJpbyB2ZWN0b3IncyBjb3B5aW5n
IGJldHdlZW4gKHBhcnRpYWwpIHBhZ2VzIGFuZCBidWZpbyBibG9ja3MuICovCj4+ICtzdGF0aWMg
aW50IF9fZWJzX3J3X2JpbyhzdHJ1Y3QgZWJzX2MgKmVjLCBpbnQgcncsIHN0cnVjdCBiaW8gKmJp
bykKPj4gK3sKPj4gKwlpbnQgciA9IDAsIHJyOwo+PiArCXN0cnVjdCBiaW9fdmVjIGJ2Owo+PiAr
CXN0cnVjdCBidmVjX2l0ZXIgaXRlcjsKPj4gKwo+PiArCWJpb19mb3JfZWFjaF9idmVjKGJ2LCBi
aW8sIGl0ZXIpIHsKPj4gKwkJcnIgPSBfX2Vic19yd19idmVjKGVjLCBydywgJmJ2LCAmaXRlcik7
Cj4+ICsJCWlmIChycikKPj4gKwkJCXIgPSBycjsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gcjsK
Pj4gK30KPj4gKwo+PiArLyogJ0Rpc2NhcmQnIGJsb2NrcywgaS5lLiByZWxlYXNlIHRoZW0gZnJv
bSB0aGUgYnVmaW8gY2FjaGUuICovCj4+ICtzdGF0aWMgaW50IF9fZWJzX2ZvcmdldF9iaW8oc3Ry
dWN0IGVic19jICplYywgc3RydWN0IGJpbyAqYmlvKQo+PiArewo+PiArCXNlY3Rvcl90IGJsb2Nr
cywgc2VjdG9yID0gYmlvLT5iaV9pdGVyLmJpX3NlY3Rvcjs7Cj4+ICsKPj4gKwlibG9ja3MgPSBf
X25yX2Jsb2NrcyhlYywgYmlvKTsKPj4gKwlmb3IgKDsgYmxvY2tzLS07IHNlY3RvciArPSBlYy0+
dV9icykKPj4gKwkJZG1fYnVmaW9fZm9yZ2V0KGVjLT5idWZpbywgX19zZWN0b3JfdG9fYmxvY2so
ZWMsIHNlY3RvcikpOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gKy8qIFdvcmtl
ciBmdW50aW9uIHRvIHByb2Nlc3MgaW5jb21pbmcgYmlvcy4gKi8KPj4gK3N0YXRpYyB2b2lkIF9f
ZWJzX3Byb2Nlc3NfYmlvcyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndzKQo+PiArewo+PiArCWludCBy
Owo+PiArCWJvb2wgd3JpdGUgPSBmYWxzZTsKPj4gKwlzZWN0b3JfdCBibG9jazEsIGJsb2NrMjsK
Pj4gKwlzdHJ1Y3QgZWJzX2MgKmVjID0gY29udGFpbmVyX29mKHdzLCBzdHJ1Y3QgZWJzX2MsIHdz
KTsKPj4gKwlzdHJ1Y3QgYmlvICpiaW87Cj4+ICsJc3RydWN0IGJpb19saXN0IGJpb3M7Cj4+ICsK
Pj4gKwliaW9fbGlzdF9pbml0KCZiaW9zKTsKPj4gKwo+PiArCXNwaW5fbG9ja19pcnEoJmVjLT5s
b2NrKTsKPj4gKwliaW9zID0gZWMtPmJpb3NfaW47Cj4+ICsJYmlvX2xpc3RfaW5pdCgmZWMtPmJp
b3NfaW4pOwo+PiArCXNwaW5fdW5sb2NrX2lycSgmZWMtPmxvY2spOwo+PiArCj4+ICsJLyogUHJl
ZmV0Y2ggYWxsIHJlYWQgYW5kIGFueSBtaXMtYWxpZ25lZCB3cml0ZSBidWZmZXJzICovCj4+ICsJ
YmlvX2xpc3RfZm9yX2VhY2goYmlvLCAmYmlvcykgewo+PiArCQlibG9jazEgPSBfX3NlY3Rvcl90
b19ibG9jayhlYywgYmlvLT5iaV9pdGVyLmJpX3NlY3Rvcik7Cj4+ICsJCWlmIChiaW9fb3AoYmlv
KSA9PSBSRVFfT1BfUkVBRCkKPj4gKwkJCWRtX2J1ZmlvX3ByZWZldGNoKGVjLT5idWZpbywgYmxv
Y2sxLCBfX25yX2Jsb2NrcyhlYywgYmlvKSk7Cj4+ICsJCWVsc2UgaWYgKGJpb19vcChiaW8pID09
IFJFUV9PUF9XUklURSAmJiAhKGJpby0+Ymlfb3BmICYgUkVRX1BSRUZMVVNIKSkgewo+PiArCQkJ
YmxvY2syID0gX19zZWN0b3JfdG9fYmxvY2soZWMsIGJpb19lbmRfc2VjdG9yKGJpbykpOwo+PiAr
CQkJaWYgKF9fYmxvY2tfbW9kKGJpby0+YmlfaXRlci5iaV9zZWN0b3IsIGVjLT51X2JzKSkKPj4g
KwkJCQlkbV9idWZpb19wcmVmZXRjaChlYy0+YnVmaW8sIGJsb2NrMSwgMSk7Cj4+ICsJCQlpZiAo
X19ibG9ja19tb2QoYmlvX2VuZF9zZWN0b3IoYmlvKSwgZWMtPnVfYnMpICYmIGJsb2NrMiAhPSBi
bG9jazEpCj4+ICsJCQkJZG1fYnVmaW9fcHJlZmV0Y2goZWMtPmJ1ZmlvLCBibG9jazIsIDEpOwo+
PiArCQl9Cj4+ICsJfQo+PiArCj4+ICsJYmlvX2xpc3RfZm9yX2VhY2goYmlvLCAmYmlvcykgewo+
PiArCQlyID0gLUVJTzsKPj4gKwo+PiArCQlpZiAoYmlvX29wKGJpbykgPT0gUkVRX09QX1JFQUQp
Cj4+ICsJCQlyID0gX19lYnNfcndfYmlvKGVjLCBSRUFELCBiaW8pOwo+PiArCQllbHNlIGlmIChi
aW9fb3AoYmlvKSA9PSBSRVFfT1BfV1JJVEUpIHsKPj4gKwkJCXdyaXRlID0gdHJ1ZTsKPj4gKwkJ
CXIgPSBfX2Vic19yd19iaW8oZWMsIFdSSVRFLCBiaW8pOwo+PiArCQl9IGVsc2UgaWYgKGJpb19v
cChiaW8pID09IFJFUV9PUF9ESVNDQVJEKQo+PiArCQkJLyogRklYTUU6IChvcHRpb25hbGx5KSBj
YWxsIGRtX2J1ZmlvX2Rpc2NhcmRfYnVmZmVycygpIG9uY2UgdXBzdHJlYW0uICovCj4+ICsJCQly
ID0gX19lYnNfZm9yZ2V0X2JpbyhlYywgYmlvKTsKPj4gKwo+PiArCQliaW8tPmJpX3N0YXR1cyA9
IHI7Cj4+ICsJfQo+PiArCj4+ICsJLyoKPj4gKwkgKiBXZSB3cml0ZSBkaXJ0eSBidWZmZXJzIGFm
dGVyIHByb2Nlc3NpbmcgSS9PIG9uIHRoZW0KPj4gKwkgKiBidXQgYmVmb3JlIHdlIGVuZGlvIHRo
dXMgYWRkcmVzc2luZyBSRVFfRlVBL1JFUV9TWU5DLgo+PiArCSAqLwo+PiArCXIgPSB3cml0ZSA/
IGRtX2J1ZmlvX3dyaXRlX2RpcnR5X2J1ZmZlcnMoZWMtPmJ1ZmlvKSA6IDA7Cj4+ICsKPj4gKwl3
aGlsZSAoKGJpbyA9IGJpb19saXN0X3BvcCgmYmlvcykpKSB7Cj4+ICsJCS8qIEFueSBvdGhlciBy
ZXF1ZXN0IGlzIGVuZGlvZWQuICovCj4+ICsJCWlmICh1bmxpa2VseShyICYmIGJpb19vcChiaW8p
ID09IFJFUV9PUF9XUklURSkpCj4+ICsJCQliaW9faW9fZXJyb3IoYmlvKTsKPj4gKwkJZWxzZQo+
PiArCQkJYmlvX2VuZGlvKGJpbyk7Cj4+ICsJfQo+PiArfQo+PiArCj4+ICsvKgo+PiArICogQ29u
c3RydWN0IGFuIGVtdWxhdGVkIGJsb2NrIHNpemUgbWFwcGluZzogPGRldl9wYXRoPiA8b2Zmc2V0
PiA8ZWJzPiBbPHVicz5dCj4+ICsgKgo+PiArICogPGRldl9wYXRoPjogcGF0aCBvZiB0aGUgdW5k
ZXJseWluZyBkZXZpY2UKPj4gKyAqIDxvZmZzZXQ+OiBvZmZzZXQgaW4gNTEyIGJ5dGVzIHNlY3Rv
cnMgaW50byA8ZGV2X3BhdGg+Cj4+ICsgKiA8ZWJzPjogZW11bGF0ZWQgYmxvY2sgc2l6ZSBpbiB1
bml0cyBvZiA1MTIgYnl0ZXMgZXhwb3NlZCB0byB0aGUgdXBwZXIgbGF5ZXIKPj4gKyAqIFs8dWJz
Pl06IHVuZGVybHlpbmcgYmxvY2sgc2l6ZSBpbiB1bml0cyBvZiA1MTIgYnl0ZXMgaW1wb3NlZCBv
biB0aGUgbG93ZXIgbGF5ZXI7Cj4+ICsgKiAJICAgIG9wdGlvbmFsLCBpZiBub3Qgc3VwcGxpZWQs
IHJldHJpZXZlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBmcm9tIHVuZGVybHlpbmcgZGV2aWNlCj4+ICsg
Ki8KPj4gK3N0YXRpYyBpbnQgZWJzX2N0cihzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwgdW5zaWduZWQg
aW50IGFyZ2MsIGNoYXIgKiphcmd2KQo+PiArewo+PiArCWludCByOwo+PiArCXVuc2lnbmVkIHNo
b3J0IHRtcDE7Cj4+ICsJdW5zaWduZWQgbG9uZyBsb25nIHRtcDsKPj4gKwljaGFyIGR1bW15Owo+
PiArCXN0cnVjdCBlYnNfYyAqZWM7Cj4+ICsKPj4gKwlpZiAoYXJnYyA8IDMgfHwgYXJnYyA+IDQp
IHsKPj4gKwkJdGktPmVycm9yID0gIkludmFsaWQgYXJndW1lbnQgY291bnQiOwo+PiArCQlyZXR1
cm4gLUVJTlZBTDsKPj4gKwl9Cj4+ICsKPj4gKwllYyA9IHRpLT5wcml2YXRlID0ga3phbGxvYyhz
aXplb2YoKmVjKSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCFlYykgewo+PiArCQl0aS0+ZXJyb3Ig
PSAiQ2Fubm90IGFsbG9jYXRlIGVicyBjb250ZXh0IjsKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+
ICsJfQo+PiArCj4+ICsJciA9IC1FSU5WQUw7Cj4+ICsJaWYgKHNzY2FuZihhcmd2WzFdLCAiJWxs
dSVjIiwgJnRtcCwgJmR1bW15KSAhPSAxIHx8Cj4+ICsJICAgIHRtcCAhPSAoc2VjdG9yX3QpdG1w
IHx8Cj4+ICsJICAgIChzZWN0b3JfdCl0bXAgPj0gdGktPmxlbikgewo+PiArCQl0aS0+ZXJyb3Ig
PSAiSW52YWxpZCBkZXZpY2Ugb2Zmc2V0IHNlY3RvciI7Cj4+ICsJCWdvdG8gYmFkOwo+PiArCX0K
Pj4gKwllYy0+c3RhcnQgPSB0bXA7Cj4+ICsKPj4gKwlpZiAoc3NjYW5mKGFyZ3ZbMl0sICIlaHUl
YyIsICZ0bXAxLCAmZHVtbXkpICE9IDEgfHwKPj4gKwkgICAgIV9fZWJzX2NoZWNrX2JzKHRtcDEp
IHx8Cj4+ICsJICAgIHRvX2J5dGVzKHRtcDEpID4gUEFHRV9TSVpFKSB7Cj4+ICsJCXRpLT5lcnJv
ciA9ICJJbnZhbGlkIGVtdWxhdGVkIGJsb2NrIHNpemUiOwo+PiArCQlnb3RvIGJhZDsKPj4gKwl9
Cj4+ICsJZWMtPmVfYnMgPSB0bXAxOwo+PiArCj4+ICsJaWYgKGFyZ2MgPiAzKSB7Cj4+ICsJCWlm
IChzc2NhbmYoYXJndlszXSwgIiVodSVjIiwgJnRtcDEsICZkdW1teSkgIT0gMSB8fCAhX19lYnNf
Y2hlY2tfYnModG1wMSkpIHsKPj4gKwkJCXRpLT5lcnJvciA9ICJJbnZhbGlkIHVuZGVybHlpbmcg
YmxvY2sgc2l6ZSI7Cj4+ICsJCQlnb3RvIGJhZDsKPj4gKwkJfQo+PiArCQllYy0+dV9icyA9IHRt
cDE7Cj4+ICsJCWVjLT51X2JzX3NldCA9IHRydWU7Cj4+ICsJfSBlbHNlCj4+ICsJCWVjLT51X2Jz
X3NldCA9IGZhbHNlOwo+PiArCj4+ICsJciA9IGRtX2dldF9kZXZpY2UodGksIGFyZ3ZbMF0sIGRt
X3RhYmxlX2dldF9tb2RlKHRpLT50YWJsZSksICZlYy0+ZGV2KTsKPj4gKwlpZiAocikgewo+PiAr
CQl0aS0+ZXJyb3IgPSAiRGV2aWNlIGxvb2t1cCBmYWlsZWQiOwo+PiArCQllYy0+ZGV2ID0gTlVM
TDsKPj4gKwkJZ290byBiYWQ7Cj4+ICsJfQo+PiArCj4+ICsJciA9IC1FSU5WQUw7Cj4+ICsJaWYg
KCFlYy0+dV9ic19zZXQpIHsKPj4gKwkJZWMtPnVfYnMgPSB0b19zZWN0b3IoYmRldl9sb2dpY2Fs
X2Jsb2NrX3NpemUoZWMtPmRldi0+YmRldikpOwo+PiArCQlpZiAoIV9fZWJzX2NoZWNrX2JzKGVj
LT51X2JzKSkgewo+PiArCQkJdGktPmVycm9yID0gIkludmFsaWQgcmV0cmlldmVkIHVuZGVybHlp
bmcgYmxvY2sgc2l6ZSI7Cj4+ICsJCQlnb3RvIGJhZDsKPj4gKwkJfQo+PiArCX0KPj4gKwo+PiAr
CWlmICghZWMtPnVfYnNfc2V0ICYmIGVjLT5lX2JzID09IGVjLT51X2JzKQo+PiArCQlETUlORk8o
IkVtdWxhdGlvbiBzdXBlcmZsdW91czogZW11bGF0ZWQgZXF1YWwgdG8gdW5kZXJseWluZyBibG9j
ayBzaXplIik7Cj4+ICsKPj4gKwlpZiAoX19ibG9ja19tb2QoZWMtPnN0YXJ0LCBlYy0+dV9icykp
IHsKPj4gKwkJdGktPmVycm9yID0gIkRldmljZSBvZmZzZXQgbXVzdCBiZSBtdWx0aXBsZSBvZiB1
bmRlcmx5aW5nIGJsb2NrIHNpemUiOwo+PiArCQlnb3RvIGJhZDsKPj4gKwl9Cj4+ICsKPj4gKwll
Yy0+YnVmaW8gPSBkbV9idWZpb19jbGllbnRfY3JlYXRlKGVjLT5kZXYtPmJkZXYsIHRvX2J5dGVz
KGVjLT51X2JzKSwgMSwgMCwgTlVMTCwgTlVMTCk7Cj4+ICsJaWYgKElTX0VSUihlYy0+YnVmaW8p
KSB7Cj4+ICsJCXRpLT5lcnJvciA9ICJDYW5ub3QgY3JlYXRlIGRtIGJ1ZmlvIGNsaWVudCI7Cj4+
ICsJCXIgPSBQVFJfRVJSKGVjLT5idWZpbyk7Cj4+ICsJCWVjLT5idWZpbyA9IE5VTEw7Cj4+ICsJ
CWdvdG8gYmFkOwo+PiArCX0KPj4gKwo+PiArCWVjLT53cSA9IGFsbG9jX29yZGVyZWRfd29ya3F1
ZXVlKCJkbS0iIERNX01TR19QUkVGSVgsIFdRX01FTV9SRUNMQUlNKTsKPj4gKwlpZiAoIWVjLT53
cSkgewo+PiArCQl0aS0+ZXJyb3IgPSAiQ2Fubm90IGNyZWF0ZSBkbS0iIERNX01TR19QUkVGSVgg
IiB3b3JrcXVldWUiOwo+PiArCQlyID0gLUVOT01FTTsKPj4gKwkJZ290byBiYWQ7Cj4+ICsJfQo+
PiArCj4+ICsJZWMtPmJsb2NrX3NoaWZ0ID0gX19mZnMoZWMtPnVfYnMpOwo+PiArCUlOSVRfV09S
SygmZWMtPndzLCAmX19lYnNfcHJvY2Vzc19iaW9zKTsKPj4gKwliaW9fbGlzdF9pbml0KCZlYy0+
Ymlvc19pbik7Cj4+ICsJc3Bpbl9sb2NrX2luaXQoJmVjLT5sb2NrKTsKPj4gKwo+PiArCXRpLT5u
dW1fZmx1c2hfYmlvcyA9IDE7Cj4+ICsJdGktPm51bV9kaXNjYXJkX2Jpb3MgPSAxOwo+PiArCXRp
LT5udW1fc2VjdXJlX2VyYXNlX2Jpb3MgPSAwOwo+PiArCXRpLT5udW1fd3JpdGVfc2FtZV9iaW9z
ID0gMDsKPj4gKwl0aS0+bnVtX3dyaXRlX3plcm9lc19iaW9zID0gMDsKPj4gKwlyZXR1cm4gMDsK
Pj4gK2JhZDoKPj4gKwllYnNfZHRyKHRpKTsKPj4gKwlyZXR1cm4gcjsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIHZvaWQgZWJzX2R0cihzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSkKPj4gK3sKPj4gKwlzdHJ1
Y3QgZWJzX2MgKmVjID0gdGktPnByaXZhdGU7Cj4+ICsKPj4gKwlpZiAoZWMtPndxKQo+PiArCQlk
ZXN0cm95X3dvcmtxdWV1ZShlYy0+d3EpOwo+PiArCWlmIChlYy0+YnVmaW8pCj4+ICsJCWRtX2J1
ZmlvX2NsaWVudF9kZXN0cm95KGVjLT5idWZpbyk7Cj4+ICsJaWYgKGVjLT5kZXYpCj4+ICsJCWRt
X3B1dF9kZXZpY2UodGksIGVjLT5kZXYpOwo+PiArCWtmcmVlKGVjKTsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIGludCBlYnNfbWFwKHN0cnVjdCBkbV90YXJnZXQgKnRpLCBzdHJ1Y3QgYmlvICpiaW8p
Cj4+ICt7Cj4+ICsJc3RydWN0IGVic19jICplYyA9IHRpLT5wcml2YXRlOwo+PiArCj4+ICsJYmlv
X3NldF9kZXYoYmlvLCBlYy0+ZGV2LT5iZGV2KTsKPj4gKwliaW8tPmJpX2l0ZXIuYmlfc2VjdG9y
ID0gZWMtPnN0YXJ0ICsgZG1fdGFyZ2V0X29mZnNldCh0aSwgYmlvLT5iaV9pdGVyLmJpX3NlY3Rv
cik7Cj4+ICsKPj4gKwlpZiAodW5saWtlbHkoYmlvLT5iaV9vcGYgJiBSRVFfT1BfRkxVU0gpKQo+
PiArCQlyZXR1cm4gRE1fTUFQSU9fUkVNQVBQRUQ7Cj4+ICsJLyoKPj4gKwkgKiBPbmx5IHF1ZXVl
IGZvciBidWZpbyBwcm9jZXNzaW5nIGluIGNhc2Ugb2YgcGFydGlhbCBvciBvdmVybGFwcGluZyBi
dWZmZXJzCj4+ICsJICogLW9yLQo+PiArCSAqIGVtdWxhdGlvbiB3aXRoIGVicyA9PSB1YnMgYWlt
aW5nIGZvciB0ZXN0cyBvZiBkbS1idWZpbyBvdmVyaGVhZC4KPj4gKwkgKi8KPj4gKwlpZiAobGlr
ZWx5KF9fYmxvY2tfbW9kKGJpby0+YmlfaXRlci5iaV9zZWN0b3IsIGVjLT51X2JzKSB8fAo+PiAr
CQkgICBfX2Jsb2NrX21vZChiaW9fZW5kX3NlY3RvcihiaW8pLCBlYy0+dV9icykgfHwKPj4gKwkJ
ICAgZWMtPmVfYnMgPT0gZWMtPnVfYnMpKSB7Cj4+ICsJCXNwaW5fbG9ja19pcnEoJmVjLT5sb2Nr
KTsKPj4gKwkJYmlvX2xpc3RfYWRkKCZlYy0+Ymlvc19pbiwgYmlvKTsKPj4gKwkJc3Bpbl91bmxv
Y2tfaXJxKCZlYy0+bG9jayk7Cj4+ICsKPj4gKwkJcXVldWVfd29yayhlYy0+d3EsICZlYy0+d3Mp
Owo+PiArCj4+ICsJCXJldHVybiBETV9NQVBJT19TVUJNSVRURUQ7Cj4+ICsJfQo+PiArCj4+ICsJ
LyogRm9yZ2V0IGFueSBidWZmZXIgY29udGVudCByZWxhdGl2ZSB0byB0aGlzIGRpcmVjdCBiYWNr
aW5nIGRldmljZSBJL08uICovCj4+ICsJX19lYnNfZm9yZ2V0X2JpbyhlYywgYmlvKTsKPj4gKwo+
PiArCXJldHVybiBETV9NQVBJT19SRU1BUFBFRDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQg
ZWJzX3N0YXR1cyhzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwgc3RhdHVzX3R5cGVfdCB0eXBlLAo+PiAr
CQkgICAgICAgdW5zaWduZWQgc3RhdHVzX2ZsYWdzLCBjaGFyICpyZXN1bHQsIHVuc2lnbmVkIG1h
eGxlbikKPj4gK3sKPj4gKwlzdHJ1Y3QgZWJzX2MgKmVjID0gdGktPnByaXZhdGU7Cj4+ICsKPj4g
Kwlzd2l0Y2ggKHR5cGUpIHsKPj4gKwljYXNlIFNUQVRVU1RZUEVfSU5GTzoKPj4gKwkJKnJlc3Vs
dCA9ICdcMCc7Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgU1RBVFVTVFlQRV9UQUJMRToKPj4gKwkJ
c25wcmludGYocmVzdWx0LCBtYXhsZW4sIGVjLT51X2JzX3NldCA/ICIlcyAlbGx1ICV1ICV1IiA6
ICIlcyAlbGx1ICV1IiwKPj4gKwkJCSBlYy0+ZGV2LT5uYW1lLCAodW5zaWduZWQgbG9uZyBsb25n
KSBlYy0+c3RhcnQsIGVjLT5lX2JzLCBlYy0+dV9icyk7Cj4+ICsJCWJyZWFrOwo+PiArCX0KPj4g
K30KPj4gKwo+PiArc3RhdGljIGludCBlYnNfcHJlcGFyZV9pb2N0bChzdHJ1Y3QgZG1fdGFyZ2V0
ICp0aSwgc3RydWN0IGJsb2NrX2RldmljZSAqKmJkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IGVic19j
ICplYyA9IHRpLT5wcml2YXRlOwo+PiArCXN0cnVjdCBkbV9kZXYgKmRldiA9IGVjLT5kZXY7Cj4+
ICsKPj4gKwkvKgo+PiArCSAqIE9ubHkgcGFzcyBpb2N0bHMgdGhyb3VnaCBpZiB0aGUgZGV2aWNl
IHNpemVzIG1hdGNoIGV4YWN0bHkuCj4+ICsJICovCj4+ICsJKmJkZXYgPSBkZXYtPmJkZXY7Cj4+
ICsJcmV0dXJuICEhKGVjLT5zdGFydCB8fCB0aS0+bGVuICE9IGlfc2l6ZV9yZWFkKGRldi0+YmRl
di0+YmRfaW5vZGUpID4+IFNFQ1RPUl9TSElGVCk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lk
IGVic19pb19oaW50cyhzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwgc3RydWN0IHF1ZXVlX2xpbWl0cyAq
bGltaXRzKQo+PiArewo+PiArCXN0cnVjdCBlYnNfYyAqZWMgPSB0aS0+cHJpdmF0ZTsKPj4gKwo+
PiArCWxpbWl0cy0+bG9naWNhbF9ibG9ja19zaXplID0gdG9fYnl0ZXMoZWMtPmVfYnMpOwo+PiAr
CWxpbWl0cy0+cGh5c2ljYWxfYmxvY2tfc2l6ZSA9IHRvX2J5dGVzKGVjLT51X2JzKTsKPj4gKwls
aW1pdHMtPmFsaWdubWVudF9vZmZzZXQgPSBsaW1pdHMtPnBoeXNpY2FsX2Jsb2NrX3NpemU7Cj4+
ICsJYmxrX2xpbWl0c19pb19taW4obGltaXRzLCBsaW1pdHMtPmxvZ2ljYWxfYmxvY2tfc2l6ZSk7
Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgZWJzX2l0ZXJhdGVfZGV2aWNlcyhzdHJ1Y3QgZG1f
dGFyZ2V0ICp0aSwKPj4gKwkJCQkgIGl0ZXJhdGVfZGV2aWNlc19jYWxsb3V0X2ZuIGZuLCB2b2lk
ICpkYXRhKQo+PiArewo+PiArCXN0cnVjdCBlYnNfYyAqZWMgPSB0aS0+cHJpdmF0ZTsKPj4gKwo+
PiArCXJldHVybiBmbih0aSwgZWMtPmRldiwgZWMtPnN0YXJ0LCB0aS0+bGVuLCBkYXRhKTsKPj4g
K30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCB0YXJnZXRfdHlwZSBlYnNfdGFyZ2V0ID0gewo+PiAr
CS5uYW1lCQkgPSAiZWJzIiwKPj4gKwkudmVyc2lvbgkgPSB7MSwgMCwgMH0sCj4+ICsJLmZlYXR1
cmVzCSA9IERNX1RBUkdFVF9QQVNTRVNfSU5URUdSSVRZLAo+PiArCS5tb2R1bGUJCSA9IFRISVNf
TU9EVUxFLAo+PiArCS5jdHIJCSA9IGVic19jdHIsCj4+ICsJLmR0cgkJID0gZWJzX2R0ciwKPj4g
KwkubWFwCQkgPSBlYnNfbWFwLAo+PiArCS5zdGF0dXMJCSA9IGVic19zdGF0dXMsCj4+ICsJLmlv
X2hpbnRzCSA9IGVic19pb19oaW50cywKPj4gKwkucHJlcGFyZV9pb2N0bAkgPSBlYnNfcHJlcGFy
ZV9pb2N0bCwKPj4gKwkuaXRlcmF0ZV9kZXZpY2VzID0gZWJzX2l0ZXJhdGVfZGV2aWNlcywKPj4g
K307Cj4+ICsKPj4gK2ludCBfX2luaXQgZG1fZWJzX2luaXQodm9pZCkKPj4gK3sKPj4gKwlpbnQg
ciA9IGRtX3JlZ2lzdGVyX3RhcmdldCgmZWJzX3RhcmdldCk7Cj4+ICsKPj4gKwlpZiAociA8IDAp
Cj4+ICsJCURNRVJSKCJyZWdpc3RlciBmYWlsZWQgJWQiLCByKTsKPj4gKwo+PiArCXJldHVybiBy
Owo+PiArfQo+PiArCj4+ICt2b2lkIGRtX2Vic19leGl0KHZvaWQpCj4+ICt7Cj4+ICsJZG1fdW5y
ZWdpc3Rlcl90YXJnZXQoJmVic190YXJnZXQpOwo+PiArfQo+PiArCj4+ICttb2R1bGVfaW5pdChk
bV9lYnNfaW5pdCk7Cj4+ICttb2R1bGVfZXhpdChkbV9lYnNfZXhpdCk7Cj4+ICsKPj4gK01PRFVM
RV9BVVRIT1IoIkhlaW56IE1hdWVsc2hhZ2VuIDxkbS1kZXZlbEByZWRoYXQuY29tPiIpOwo+PiAr
TU9EVUxFX0RFU0NSSVBUSU9OKERNX05BTUUgIiBlbXVsYXRlZCBibG9jayBzaXplIHRhcmdldCIp
Owo+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+PgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVs

