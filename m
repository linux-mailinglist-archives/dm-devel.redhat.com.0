Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2A142792
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 10:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579513562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZQgrwKkYWg5Eu8B44z+nd+D5h2RALrCqNlb0lAog/6w=;
	b=TwpOVl6YMW9PwzhAviEmYqoXA2HQZ/giLxOo9InSnhhG3egfDbc26nDE9WU50p13+7CUV0
	q6R6R4YtNdWhWIoavad+VPTSyKeZRn0ONJvM5pR2rwdyvhgZOdc7InUZRGEQa+zEKQxTk6
	+007RrqwU4viYA53jqDNo547cbM50I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-QCY9E_w7PyuBEb18NN57rQ-1; Mon, 20 Jan 2020 04:45:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCCC3800D48;
	Mon, 20 Jan 2020 09:45:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DCB1C94F;
	Mon, 20 Jan 2020 09:45:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A89E78196C;
	Mon, 20 Jan 2020 09:45:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HC7fKB004471 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 07:07:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AACD1202A941; Fri, 17 Jan 2020 12:07:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A541F2026D68
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 12:07:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D79EB85A332
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 12:07:39 +0000 (UTC)
X-AuditID: c39127d2-c07ff70000002a58-65-5e219ff51aef
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210]) by
	relay.mimecast.com with ESMTP id us-mta-93-FKkC-T6tMveIpaToqrTbjw-1;
	Fri, 17 Jan 2020 07:07:37 -0500
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	CA.8F.10840.5FF912E5; Fri, 17 Jan 2020 12:52:21 +0100 (CET)
Received: from [172.16.20.241] ([172.16.20.241])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2020011712522129-160139 ;
	Fri, 17 Jan 2020 12:52:21 +0100
To: Franck LENORMAND <franck.lenormand@nxp.com>,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
References: <1551456599-10603-1-git-send-email-franck.lenormand@nxp.com>
	<1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
From: Maik Otto <m.otto@phytec.de>
Message-ID: <97ab8779-1351-0030-7a9f-fababe1f57c2@phytec.de>
Date: Fri, 17 Jan 2020 12:52:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1551456599-10603-3-git-send-email-franck.lenormand@nxp.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 17.01.2020 12:52:21,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 17.01.2020 12:52:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWyRoCBS/frfMU4g6+bRCzWnzrGbPGu6TeL
	xd53s1ktmla/Z7b4cP4wk8W69YuZLLbeaWKz+NDziM3i/IVz7BZLF19jtmjb+JXRgdvj2u5I
	j57vyR4b3+1g8ni/7yqbx+dNcgGsUVw2Kak5mWWpRfp2CVwZDeefsxf8V6noaJRrYDwh28XI
	ySEhYCKx/vY61i5GLg4hga2MEp/3X2KCcM4wSmz584wRpEpYwFvizJ0rzCC2iECBxK+73xlB
	ipgFljBKrP41lQWio51R4tGdBWBVbAJKEg/nrgazeQVsJCZcmMYCYrMIqEo8fvgSLC4qkCjx
	ruEtVI2gxMmZT8BqOAU8JWb3LwS7SULgCqPEynWrWSGOFZI4vfgsWAOzgJnEvM0PoWxtiWUL
	XzNPYBSchWTWLCRls5CULWBkXsUolJuZnJ1alJmtV5BRWZKarJeSuokRGCGHJ6pf2sHYN8fj
	ECMTB+MhRgkOZiUR3ru9inFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YW
	pBbBZJk4OKUaGGd/nhn4d8b7bTFHrCNKYt40Fyned/N8W3Gn4FGbnObk0I2Huc/Lal6VMIvX
	qWd56WV9xt5a3OGUlP7cuOgMs7c27Nmib2Iqmv9YF3zTWi80M614R3ZNZblSWAPTMo8Jr1ad
	FHz9QNZnf/7K4F+POycv/CbItuvhymNS89f/ONbfJsV1Ovu7phJLcUaioRZzUXEiAH2Okfl+
	AgAA
X-MC-Unique: FKkC-T6tMveIpaToqrTbjw-1
X-MC-Unique: QCY9E_w7PyuBEb18NN57rQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HC7fKB004471
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Jan 2020 04:45:28 -0500
Cc: horia.geanta@nxp.com, snitzer@redhat.com, jmorris@namei.org,
	dhowells@redhat.com, dm-devel@redhat.com,
	silvano.dininno@nxp.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm-crypt: Use any key type which is
	registered
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

SGkKCmxpdHRsZSBidWcgZml4LCBiZWNhdXNlIHRoaXMgdmVyc2lvbiBjaHJhc2hlZCB3aXRoIGFj
Y2VzcyB2aW9sYXRpb24Kb24gYW4gaS5NWDZRdWFkIHdpdGggYSBNYWlubGluZSBLZXJuZWwgNC4x
OS44OAoKPiBUaGVyZSB3YXMgb25seSAyIGtleV90eXBlIHN1cHBvcnRlZCBieSBkbS1jcnlwdCB3
aGljaCBsaW1pdHMgb3RoZXIKPiBpbXBsZW1lbnRhdGlvbnMuCj4KPiBUaGlzIHBhdGNoIGFsbG93
cyB0byB1c2UgYW55IGtleV90eXBlIHdoaWNoIGlzIHJlZ2lzdGVyZWQgb2J0YWluaW5nCj4gdGhl
IGtleV90eXBlIGZyb20ga2V5IGZyYW1ld29yay4KPgo+IFRoaXMgYWxzbyByZW1vdmUgdGhlIGNv
bXBpbGF0aW9uIGRlcGVuZGVuY3kgYmV0d2VlbiBkbS1jcnlwdCBhbmQKPiBrZXkgaW1wbGVtZW50
YXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNrIExFTk9STUFORCA8ZnJhbmNrLmxlbm9y
bWFuZEBueHAuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tZC9kbS1jcnlwdC5jICAgIHwgMTEgKysr
KysrLS0tLS0KPiAgIGluY2x1ZGUvbGludXgva2V5LXR5cGUuaCB8ICAyICsrCj4gICBzZWN1cml0
eS9rZXlzL2tleS5jICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLWNyeXB0LmMgYi9kcml2ZXJzL21k
L2RtLWNyeXB0LmMKPiBpbmRleCBkZDUzOGU2Li5lMjVlZmMyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbWQvZG0tY3J5cHQuYwo+ICsrKyBiL2RyaXZlcnMvbWQvZG0tY3J5cHQuYwo+IEBAIC0zNSw2
ICszNSw3IEBACj4gICAjaW5jbHVkZSA8Y3J5cHRvL2F1dGhlbmMuaD4KPiAgICNpbmNsdWRlIDxs
aW51eC9ydG5ldGxpbmsuaD4gLyogZm9yIHN0cnVjdCBydGF0dHIgYW5kIFJUQSBtYWNyb3Mgb25s
eSAqLwo+ICAgI2luY2x1ZGUgPGtleXMvdXNlci10eXBlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9r
ZXktdHlwZS5oPgo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLW1hcHBlci5oPgo+ICAg
Cj4gQEAgLTIwMTAsNiArMjAxMSw3IEBAIHN0YXRpYyBpbnQgY3J5cHRfc2V0X2tleXJpbmdfa2V5
KHN0cnVjdCBjcnlwdF9jb25maWcgKmNjLCBjb25zdCBjaGFyICprZXlfc3RyaW5nCj4gICAJaW50
IHJldDsKPiAgIAlzdHJ1Y3Qga2V5ICprZXk7Cj4gICAJY29uc3Qgc3RydWN0IHVzZXJfa2V5X3Bh
eWxvYWQgKnVrcDsKPiArCXN0cnVjdCBrZXlfdHlwZSAqdHlwZTsKPiAgIAo+ICAgCS8qCj4gICAJ
ICogUmVqZWN0IGtleV9zdHJpbmcgd2l0aCB3aGl0ZXNwYWNlLiBkbSBjb3JlIGN1cnJlbnRseSBs
YWNrcyBjb2RlIGZvcgo+IEBAIC0yMDI1LDE2ICsyMDI3LDE1IEBAIHN0YXRpYyBpbnQgY3J5cHRf
c2V0X2tleXJpbmdfa2V5KHN0cnVjdCBjcnlwdF9jb25maWcgKmNjLCBjb25zdCBjaGFyICprZXlf
c3RyaW5nCj4gICAJaWYgKCFrZXlfZGVzYyB8fCBrZXlfZGVzYyA9PSBrZXlfc3RyaW5nIHx8ICFz
dHJsZW4oa2V5X2Rlc2MgKyAxKSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiAtCWlmIChz
dHJuY21wKGtleV9zdHJpbmcsICJsb2dvbjoiLCBrZXlfZGVzYyAtIGtleV9zdHJpbmcgKyAxKSAm
Jgo+IC0JICAgIHN0cm5jbXAoa2V5X3N0cmluZywgInVzZXI6Iiwga2V5X2Rlc2MgLSBrZXlfc3Ry
aW5nICsgMSkpCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl0eXBlID0gZ2V0X2tleV90eXBlKGtl
eV9zdHJpbmcsIGtleV9kZXNjIC0ga2V5X3N0cmluZyk7Cj4gKwlpZiAoIXR5cGUpCj4gKwkJcmV0
dXJuIC1FTk9FTlQ7Cj4gICAKPiAgIAluZXdfa2V5X3N0cmluZyA9IGtzdHJkdXAoa2V5X3N0cmlu
ZywgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFuZXdfa2V5X3N0cmluZykKPiAgIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gICAKPiAtCWtleSA9IHJlcXVlc3Rfa2V5KGtleV9zdHJpbmdbMF0gPT0gJ2wnID8g
JmtleV90eXBlX2xvZ29uIDogJmtleV90eXBlX3VzZXIsCj4gLQkJCSAga2V5X2Rlc2MgKyAxLCBO
VUxMKTsKPiArCWtleSA9IHJlcXVlc3Rfa2V5KHR5cGUsIGtleV9kZXNjICsgMSwgTlVMTCk7Cj4g
ICAJaWYgKElTX0VSUihrZXkpKSB7Cj4gICAJCWt6ZnJlZShuZXdfa2V5X3N0cmluZyk7Cj4gICAJ
CXJldHVybiBQVFJfRVJSKGtleSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2V5LXR5
cGUuaCBiL2luY2x1ZGUvbGludXgva2V5LXR5cGUuaAo+IGluZGV4IGJjOWFmNTUuLjJiMjE2N2Ig
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rZXktdHlwZS5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9rZXktdHlwZS5oCj4gQEAgLTE3Niw2ICsxNzYsOCBAQCBleHRlcm4gc3RydWN0IGtleV90
eXBlIGtleV90eXBlX2tleXJpbmc7Cj4gICBleHRlcm4gaW50IHJlZ2lzdGVyX2tleV90eXBlKHN0
cnVjdCBrZXlfdHlwZSAqa3R5cGUpOwo+ICAgZXh0ZXJuIHZvaWQgdW5yZWdpc3Rlcl9rZXlfdHlw
ZShzdHJ1Y3Qga2V5X3R5cGUgKmt0eXBlKTsKPiAgIAo+ICtleHRlcm4gc3RydWN0IGtleV90eXBl
ICpnZXRfa2V5X3R5cGUoY29uc3QgY2hhciAqdHlwZV9uYW1lLCBzaXplX3Qgc3RyaW5nX3NpemUp
Owo+ICsKPiAgIGV4dGVybiBpbnQga2V5X3BheWxvYWRfcmVzZXJ2ZShzdHJ1Y3Qga2V5ICprZXks
IHNpemVfdCBkYXRhbGVuKTsKPiAgIGV4dGVybiBpbnQga2V5X2luc3RhbnRpYXRlX2FuZF9saW5r
KHN0cnVjdCBrZXkgKmtleSwKPiAgIAkJCQkgICAgY29uc3Qgdm9pZCAqZGF0YSwKPiBkaWZmIC0t
Z2l0IGEvc2VjdXJpdHkva2V5cy9rZXkuYyBiL3NlY3VyaXR5L2tleXMva2V5LmMKPiBpbmRleCA0
NGE4MGQ2Li5lZjc2MTE0IDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L2tleXMva2V5LmMKPiArKysg
Yi9zZWN1cml0eS9rZXlzL2tleS5jCj4gQEAgLTExNTYsNiArMTE1Niw0OCBAQCB2b2lkIHVucmVn
aXN0ZXJfa2V5X3R5cGUoc3RydWN0IGtleV90eXBlICprdHlwZSkKPiAgIH0KPiAgIEVYUE9SVF9T
WU1CT0wodW5yZWdpc3Rlcl9rZXlfdHlwZSk7Cj4gICAKPiArLyoqCj4gKyAqIGdldF9rZXlfdHlw
ZSAtIEdldCB0aGUgdHlwZSBvZiBrZXkgdXNpbmcgaXRzIG5hbWUKPiArICogQHR5cGVfbmFtZTog
TmFtZSBvZiB0aGUga2V5IHR5cGUgdG8gZ2V0Cj4gKyAqIEBzdHJpbmdfc2l6ZTogU2l6ZSBvZiB0
aGUgc3RyaW5nIHRvIG1hdGNoCj4gKyAqCj4gKyAqIFRoZSBmdW5jdGlvbnMgc3VwcG9ydCBudWxs
IGVuZGVkIHN0cmluZyAoc3RyaW5nX3NpemUgPT0gMCkgYXMgd2VsbCBhcwo+ICsgKiBwb2ludGVy
IG9uIGEgc3RyaW5nIG1hdGNoaW5nIGEgbnVtYmVyIG9mIGNoYXJhY3RlcnMgKHN0cmluZ19zaXpl
ID4gMCkKPiArICoKPiArICogUmV0dXJucyBhIHBvaW50ZXIgb24gdGhlIGtleSB0eXBlIGlmIHN1
Y2Nlc3NmdWwsIC1FTk9FTlQgaWYgdGhlIGtleSB0eXBlCj4gKyAqIGlzIG5vdCByZWdpc3RlcmVk
Lgo+ICsgKi8KPiArc3RydWN0IGtleV90eXBlICpnZXRfa2V5X3R5cGUoY29uc3QgY2hhciAqdHlw
ZV9uYW1lLCBzaXplX3Qgc3RyaW5nX3NpemUpCj4gK3sKPiArCXN0cnVjdCBrZXlfdHlwZSAqcDsK
PiArCXN0cnVjdCBrZXlfdHlwZSAqa3R5cGUgPSBFUlJfUFRSKC1FTk9FTlQpOwo+ICsKPiArCWlm
ICghdHlwZV9uYW1lKQo+ICsJCXJldHVybiBrdHlwZTsKPiArCj4gKwlkb3duX3dyaXRlKCZrZXlf
dHlwZXNfc2VtKTsKCmRvd25fd3JpdGUoJmtleV90eXBlc19zZW0pO8KgIGNoYW5nZWQgdG8gZG93
bl9yZWFkKCZrZXlfdHlwZXNfc2VtKTsKCj4gKwo+ICsJLyogU2VhcmNoIHRoZSBrZXkgdHlwZSBp
biB0aGUgbGlzdCAqLwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShwLCAma2V5X3R5cGVzX2xpc3Qs
IGxpbmspIHsKPiArCQlpZiAoc3RyaW5nX3NpemUpIHsKPiArCQkJaWYgKHN0cm5jbXAocC0+bmFt
ZSwgdHlwZV9uYW1lLCBzdHJpbmdfc2l6ZSkgPT0gMCkgewo+ICsJCQkJa3R5cGUgPSBwOwo+ICsJ
CQkJYnJlYWs7Cj4gKwkJCX0KPiArCQl9IGVsc2Ugewo+ICsJCQlpZiAoc3RyY21wKHAtPm5hbWUs
IHR5cGVfbmFtZSkgPT0gMCkgewo+ICsJCQkJa3R5cGUgPSBwOwo+ICsJCQkJYnJlYWs7Cj4gKwkJ
CX0KPiArCQl9Cj4gKwl9Cj4gKwo+ICsJdXBfcmVhZCgma2V5X3R5cGVzX3NlbSk7Cj4gKwo+ICsJ
cmV0dXJuIGt0eXBlOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZ2V0X2tleV90eXBlKTsKPiArCj4g
ICAvKgo+ICAgICogSW5pdGlhbGlzZSB0aGUga2V5IG1hbmFnZW1lbnQgc3RhdGUuCj4gICAgKi8K
PgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

