Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 621211A73C7
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586846192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K3kIjFnakJfvwP2Y8NPOAcDe/RrAO9tEdkvMRPfZ7Bs=;
	b=NlxGUWEdU6aoamANRLlEitnlgx+/DSZP5o90qTElbRnMizGWvgZLWmYHQ0YA+jNFHWG0TW
	CtkOd9GnVLLP4Zo/TsFJYJuttpDGiQ4c2mxobdxok4MTyamZxQY2FaLvGs5JaBtwBFLyJS
	9TlegSTdhPm58y79ezFHmImpbJDFmmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-1oTU7TnGMHSh9ohYOFpaNA-1; Tue, 14 Apr 2020 02:36:30 -0400
X-MC-Unique: 1oTU7TnGMHSh9ohYOFpaNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700D38005B0;
	Tue, 14 Apr 2020 06:36:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF322719C;
	Tue, 14 Apr 2020 06:36:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2330693068;
	Tue, 14 Apr 2020 06:36:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E6aIPG005137 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 02:36:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFFBF20267F2; Tue, 14 Apr 2020 06:36:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC0F02026D68
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:36:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EEF480029A
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:36:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-238-xIwNhx8oOtaBnpD7_K0-8Q-1;
	Tue, 14 Apr 2020 02:36:10 -0400
X-MC-Unique: xIwNhx8oOtaBnpD7_K0-8Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 84D9BAB3D;
	Tue, 14 Apr 2020 06:36:08 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-8-hare@suse.de>
	<BY5PR04MB6900300E586A0BD669A88305E7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <7642cdcf-3458-9a11-bdf0-8f978d463664@suse.de>
Date: Tue, 14 Apr 2020 08:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900300E586A0BD669A88305E7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E6aIPG005137
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/11] dm-zoned: replace 'target' pointer in
 the bio context
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

T24gNC8xMC8yMCA4OjUyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzA0LzA5
IDE1OjQ1LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IFJlcGxhY2UgdGhlICd0YXJnZXQnIHBv
aW50ZXIgaW4gdGhlIGJpbyBjb250ZXh0IHdpdGggdGhlCj4+IGRldmljZSBwb2ludGVyIGFzIHRo
aXMgaXMgd2hhdCdzIGFjdHVhbGx5IHVzZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbm5lcyBS
ZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+PiAtLS0KPj4gICBkcml2ZXJzL21kL2RtLXpvbmVkLXRh
cmdldC5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYyBiL2RyaXZlcnMvbWQvZG0tem9u
ZWQtdGFyZ2V0LmMKPj4gaW5kZXggZmEyOTczNDhmMGJiLi4xZWUxMDc4OWYwNGQgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMKPj4gKysrIGIvZHJpdmVycy9tZC9k
bS16b25lZC10YXJnZXQuYwo+PiBAQCAtMTcsNyArMTcsNyBAQAo+PiAgICAqIFpvbmUgQklPIGNv
bnRleHQuCj4+ICAgICovCj4+ICAgc3RydWN0IGRtel9iaW9jdHggewo+PiAtCXN0cnVjdCBkbXpf
dGFyZ2V0CSp0YXJnZXQ7Cj4+ICsJc3RydWN0IGRtel9kZXYJCSpkZXY7Cj4+ICAgCXN0cnVjdCBk
bV96b25lCQkqem9uZTsKPj4gICAJc3RydWN0IGJpbwkJKmJpbzsKPj4gICAJcmVmY291bnRfdAkJ
cmVmOwo+PiBAQCAtNzEsNiArNzEsMTEgQEAgc3RydWN0IGRtel90YXJnZXQgewo+PiAgICAqLwo+
PiAgICNkZWZpbmUgRE1aX0ZMVVNIX1BFUklPRAkoMTAgKiBIWikKPj4gICAKPj4gK3N0cnVjdCBk
bXpfZGV2ICpkbXpfc2VjdF90b19kZXYoc3RydWN0IGRtel90YXJnZXQgKmRteiwgc2VjdG9yX3Qg
c2VjdCkKPj4gK3sKPj4gKwlyZXR1cm4gJmRtei0+ZGV2WzBdOwo+PiArfQo+PiArCj4+ICAgLyoK
Pj4gICAgKiBUYXJnZXQgQklPIGNvbXBsZXRpb24uCj4+ICAgICovCj4+IEBAIC04MSw3ICs4Niw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkbXpfYmlvX2VuZGlvKHN0cnVjdCBiaW8gKmJpbywgYmxr
X3N0YXR1c190IHN0YXR1cykKPj4gICAJaWYgKHN0YXR1cyAhPSBCTEtfU1RTX09LICYmIGJpby0+
Ymlfc3RhdHVzID09IEJMS19TVFNfT0spCj4+ICAgCQliaW8tPmJpX3N0YXR1cyA9IHN0YXR1czsK
Pj4gICAJaWYgKGJpby0+Ymlfc3RhdHVzICE9IEJMS19TVFNfT0spCj4+IC0JCWJpb2N0eC0+dGFy
Z2V0LT5kZXYtPmZsYWdzIHw9IERNWl9DSEVDS19CREVWOwo+PiArCQliaW9jdHgtPmRldi0+Zmxh
Z3MgfD0gRE1aX0NIRUNLX0JERVY7Cj4+ICAgCj4+ICAgCWlmIChyZWZjb3VudF9kZWNfYW5kX3Rl
c3QoJmJpb2N0eC0+cmVmKSkgewo+PiAgIAkJc3RydWN0IGRtX3pvbmUgKnpvbmUgPSBiaW9jdHgt
PnpvbmU7Cj4+IEBAIC0xMTgsMTQgKzEyMywyMCBAQCBzdGF0aWMgaW50IGRtel9zdWJtaXRfYmlv
KHN0cnVjdCBkbXpfdGFyZ2V0ICpkbXosIHN0cnVjdCBkbV96b25lICp6b25lLAo+PiAgIAkJCSAg
c3RydWN0IGJpbyAqYmlvLCBzZWN0b3JfdCBjaHVua19ibG9jaywKPj4gICAJCQkgIHVuc2lnbmVk
IGludCBucl9ibG9ja3MpCj4+ICAgewo+PiAtCXN0cnVjdCBkbXpfYmlvY3R4ICpiaW9jdHggPSBk
bV9wZXJfYmlvX2RhdGEoYmlvLCBzaXplb2Yoc3RydWN0IGRtel9iaW9jdHgpKTsKPj4gKwlzdHJ1
Y3QgZG16X2RldiAqZGV2ID0gZG16X3pvbmVfdG9fZGV2KGRtei0+bWV0YWRhdGEsIHpvbmUpOwo+
PiArCXN0cnVjdCBkbXpfYmlvY3R4ICpiaW9jdHggPQo+PiArCQlkbV9wZXJfYmlvX2RhdGEoYmlv
LCBzaXplb2Yoc3RydWN0IGRtel9iaW9jdHgpKTsKPj4gICAJc3RydWN0IGJpbyAqY2xvbmU7Cj4+
ICAgCj4+ICsJaWYgKGRldi0+ZmxhZ3MgJiBETVpfQkRFVl9EWUlORykKPj4gKwkJcmV0dXJuIC1F
SU87Cj4+ICsKPj4gICAJY2xvbmUgPSBiaW9fY2xvbmVfZmFzdChiaW8sIEdGUF9OT0lPLCAmZG16
LT5iaW9fc2V0KTsKPj4gICAJaWYgKCFjbG9uZSkKPj4gICAJCXJldHVybiAtRU5PTUVNOwo+PiAg
IAo+PiAtCWJpb19zZXRfZGV2KGNsb25lLCBkbXotPmRldi0+YmRldik7Cj4+ICsJYmlvX3NldF9k
ZXYoY2xvbmUsIGRldi0+YmRldik7Cj4+ICsJYmlvY3R4LT5kZXYgPSBkZXY7Cj4+ICAgCWNsb25l
LT5iaV9pdGVyLmJpX3NlY3RvciA9Cj4+ICAgCQlkbXpfc3RhcnRfc2VjdChkbXotPm1ldGFkYXRh
LCB6b25lKSArIGRtel9ibGsyc2VjdChjaHVua19ibG9jayk7Cj4+ICAgCWNsb25lLT5iaV9pdGVy
LmJpX3NpemUgPSBkbXpfYmxrMnNlY3QobnJfYmxvY2tzKSA8PCBTRUNUT1JfU0hJRlQ7Cj4+IEBA
IC0yMTgsOCArMjI5LDEwIEBAIHN0YXRpYyBpbnQgZG16X2hhbmRsZV9yZWFkKHN0cnVjdCBkbXpf
dGFyZ2V0ICpkbXosIHN0cnVjdCBkbV96b25lICp6b25lLAo+PiAgIAo+PiAgIAkJaWYgKG5yX2Js
b2Nrcykgewo+PiAgIAkJCS8qIFZhbGlkIGJsb2NrcyBmb3VuZDogcmVhZCB0aGVtICovCj4+IC0J
CQlucl9ibG9ja3MgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIG5yX2Jsb2NrcywgZW5kX2Jsb2NrIC0g
Y2h1bmtfYmxvY2spOwo+PiAtCQkJcmV0ID0gZG16X3N1Ym1pdF9iaW8oZG16LCByem9uZSwgYmlv
LCBjaHVua19ibG9jaywgbnJfYmxvY2tzKTsKPj4gKwkJCW5yX2Jsb2NrcyA9IG1pbl90KHVuc2ln
bmVkIGludCwgbnJfYmxvY2tzLAo+PiArCQkJCQkgIGVuZF9ibG9jayAtIGNodW5rX2Jsb2NrKTsK
Pj4gKwkJCXJldCA9IGRtel9zdWJtaXRfYmlvKGRteiwgcnpvbmUsIGJpbywKPj4gKwkJCQkJICAg
ICBjaHVua19ibG9jaywgbnJfYmxvY2tzKTsKPj4gICAJCQlpZiAocmV0KQo+PiAgIAkJCQlyZXR1
cm4gcmV0Owo+PiAgIAkJCWNodW5rX2Jsb2NrICs9IG5yX2Jsb2NrczsKPj4gQEAgLTMzMCwxNCAr
MzQzLDE2IEBAIHN0YXRpYyBpbnQgZG16X2hhbmRsZV93cml0ZShzdHJ1Y3QgZG16X3RhcmdldCAq
ZG16LCBzdHJ1Y3QgZG1fem9uZSAqem9uZSwKPj4gICAJCSAqIGFuZCB0aGUgQklPIGlzIGFsaWdu
ZWQgdG8gdGhlIHpvbmUgd3JpdGUgcG9pbnRlcjoKPj4gICAJCSAqIGRpcmVjdCB3cml0ZSB0aGUg
em9uZS4KPj4gICAJCSAqLwo+PiAtCQlyZXR1cm4gZG16X2hhbmRsZV9kaXJlY3Rfd3JpdGUoZG16
LCB6b25lLCBiaW8sIGNodW5rX2Jsb2NrLCBucl9ibG9ja3MpOwo+PiArCQlyZXR1cm4gZG16X2hh
bmRsZV9kaXJlY3Rfd3JpdGUoZG16LCB6b25lLCBiaW8sCj4+ICsJCQkJCSAgICAgICBjaHVua19i
bG9jaywgbnJfYmxvY2tzKTsKPj4gICAJfQo+PiAgIAo+PiAgIAkvKgo+PiAgIAkgKiBUaGlzIGlz
IGFuIHVuYWxpZ25lZCB3cml0ZSBpbiBhIHNlcXVlbnRpYWwgem9uZToKPj4gICAJICogdXNlIGJ1
ZmZlcmVkIHdyaXRlLgo+PiAgIAkgKi8KPj4gLQlyZXR1cm4gZG16X2hhbmRsZV9idWZmZXJlZF93
cml0ZShkbXosIHpvbmUsIGJpbywgY2h1bmtfYmxvY2ssIG5yX2Jsb2Nrcyk7Cj4+ICsJcmV0dXJu
IGRtel9oYW5kbGVfYnVmZmVyZWRfd3JpdGUoZG16LCB6b25lLCBiaW8sCj4+ICsJCQkJCSBjaHVu
a19ibG9jaywgbnJfYmxvY2tzKTsKPj4gICB9Cj4+ICAgCj4+ICAgLyoKPj4gQEAgLTM4Myw3ICsz
OTgsNiBAQCBzdGF0aWMgaW50IGRtel9oYW5kbGVfZGlzY2FyZChzdHJ1Y3QgZG16X3RhcmdldCAq
ZG16LCBzdHJ1Y3QgZG1fem9uZSAqem9uZSwKPj4gICBzdGF0aWMgdm9pZCBkbXpfaGFuZGxlX2Jp
byhzdHJ1Y3QgZG16X3RhcmdldCAqZG16LCBzdHJ1Y3QgZG1fY2h1bmtfd29yayAqY3csCj4+ICAg
CQkJICAgc3RydWN0IGJpbyAqYmlvKQo+PiAgIHsKPj4gLQlzdHJ1Y3QgZG16X2Jpb2N0eCAqYmlv
Y3R4ID0gZG1fcGVyX2Jpb19kYXRhKGJpbywgc2l6ZW9mKHN0cnVjdCBkbXpfYmlvY3R4KSk7Cj4+
ICAgCXN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCA9IGRtei0+bWV0YWRhdGE7Cj4+ICAgCXN0cnVj
dCBkbV96b25lICp6b25lOwo+PiAgIAlpbnQgcmV0Owo+PiBAQCAtMzk3LDExICs0MTEsNiBAQCBz
dGF0aWMgdm9pZCBkbXpfaGFuZGxlX2JpbyhzdHJ1Y3QgZG16X3RhcmdldCAqZG16LCBzdHJ1Y3Qg
ZG1fY2h1bmtfd29yayAqY3csCj4+ICAgCj4+ICAgCWRtel9sb2NrX21ldGFkYXRhKHptZCk7Cj4+
ICAgCj4+IC0JaWYgKGRtei0+ZGV2LT5mbGFncyAmIERNWl9CREVWX0RZSU5HKSB7Cj4+IC0JCXJl
dCA9IC1FSU87Cj4+IC0JCWdvdG8gb3V0Owo+PiAtCX0KPiAKPiBBcmUgeW91IHJlbW92aW5nIHRo
aXMgYmVjYXVzZSB5b3UgYWRkZWQgdGhlIGNoZWNrIHRvIGRtel9zdWJtaXRfYmlvKCkgPwo+IApZ
ZXMuCgo+PiAtCj4+ICAgCS8qCj4+ICAgCSAqIEdldCB0aGUgZGF0YSB6b25lIG1hcHBpbmcgdGhl
IGNodW5rLiBUaGVyZSBtYXkgYmUgbm8KPj4gICAJICogbWFwcGluZyBmb3IgcmVhZCBhbmQgZGlz
Y2FyZC4gSWYgYSBtYXBwaW5nIGlzIG9idGFpbmVkLAo+PiBAQCAtNDE1LDEwICs0MjQsOCBAQCBz
dGF0aWMgdm9pZCBkbXpfaGFuZGxlX2JpbyhzdHJ1Y3QgZG16X3RhcmdldCAqZG16LCBzdHJ1Y3Qg
ZG1fY2h1bmtfd29yayAqY3csCj4+ICAgCX0KPj4gICAKPj4gICAJLyogUHJvY2VzcyB0aGUgQklP
ICovCj4+IC0JaWYgKHpvbmUpIHsKPj4gKwlpZiAoem9uZSkKPj4gICAJCWRtel9hY3RpdmF0ZV96
b25lKHpvbmUpOwo+PiAtCQliaW9jdHgtPnpvbmUgPSB6b25lOwo+IAo+IFdoeSBhcmUgeW91IHJl
bW92aW5nIHRoaXMgPyBUaGlzIGlzIHVzZWQgaW4gZG16X2Jpb19lbmRpbygpLi4uCj4gCj4gCkJ6
enQuIEluZGVlZCwgeW91IGFyZSBjb3JyZWN0LiBXaWxsIGJlIGZpeGluZyBpdCB1cCBmb3IgdGhl
IG5leHQgcm91bmQuCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAg
ICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAo
QUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

