Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD17867C3
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 19:15:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4667A2CE90A;
	Thu,  8 Aug 2019 17:15:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F53A600CC;
	Thu,  8 Aug 2019 17:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CA2C18005A4;
	Thu,  8 Aug 2019 17:15:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78HFJlT017963 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 13:15:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A82A71F4; Thu,  8 Aug 2019 17:15:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B93181E2;
	Thu,  8 Aug 2019 17:15:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2C987EBAE;
	Thu,  8 Aug 2019 17:15:12 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 021E92184E;
	Thu,  8 Aug 2019 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565284512;
	bh=kyGM/qQKhDJIBrPc+j1pg6hHWKXYr9tMgkcFnysFN74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/AUcgekcAa7FaOUC3I52nk2J7FozQrmXzSY5K0YJO02HLbXWWmF4MAj/sQpNLcDt
	j85pchv/GzqFwmQkofIYd3qj7AyxPhWGJxFUIhySd28nPKcgI9q1wa4W0KmBOk+W7z
	Y0qUS3HM+qIqVbRigJO68to35ZCul45HwEZvLLy4=
Date: Thu, 8 Aug 2019 10:15:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Message-ID: <20190808171508.GA201004@gmail.com>
Mail-Followup-To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Milan Broz <gmazyland@gmail.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
	<MN2PR20MB297336108DF89337DDEEE2F6CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu_jFW26boEhpnAZg9sjWWZf60FXSWuSqNvC5FJiL7EVSA@mail.gmail.com>
	<MN2PR20MB2973A02FC4D6F1D11BA80792CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu8fgg=gt4LSnCfShnf0-PZ=B1TNwM3zdQr+V6hkozgDOA@mail.gmail.com>
	<MN2PR20MB29733EEF59CCD754256D5621CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190808083059.GB5319@sol.localdomain>
	<MN2PR20MB297328E243D74E03C1EF54ACCAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<67b4f0ee-b169-8af4-d7af-1c53a66ba587@gmail.com>
	<MN2PR20MB29739B9D16130F5C06831C92CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR20MB29739B9D16130F5C06831C92CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 08 Aug 2019 17:15:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 08 Aug 2019 17:15:12 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.802  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Milan Broz <gmazyland@gmail.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
 for IV generation
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 08 Aug 2019 17:15:57 +0000 (UTC)

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDE6MjM6MTBQTSArMDAwMCwgUGFzY2FsIFZhbiBMZWV1
d2VuIHdyb3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IE1pbGFu
IEJyb3ogPGdtYXp5bGFuZEBnbWFpbC5jb20+Cj4gPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDgs
IDIwMTkgMjo1MyBQTQo+ID4gVG86IFBhc2NhbCBWYW4gTGVldXdlbiA8cHZhbmxlZXV3ZW5AdmVy
aW1hdHJpeC5jb20+OyBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+Cj4gPiBDYzog
QXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+OyBsaW51eC1jcnlwdG9A
dmdlci5rZXJuZWwub3JnOwo+ID4gaGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1OyBhZ2tAcmVk
aGF0LmNvbTsgc25pdHplckByZWRoYXQuY29tOyBkbS1kZXZlbEByZWRoYXQuY29tCj4gPiBTdWJq
ZWN0OiBSZTogW1JGQyBQQVRDSCB2Ml0gbWQvZG0tY3J5cHQgLSByZXVzZSBlYm9pdiBza2NpcGhl
ciBmb3IgSVYgZ2VuZXJhdGlvbgo+ID4gCj4gPiBPbiAwOC8wOC8yMDE5IDExOjMxLCBQYXNjYWwg
VmFuIExlZXV3ZW4gd3JvdGU6Cj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
Pj4gRnJvbTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPgo+ID4gPj4gU2VudDog
VGh1cnNkYXksIEF1Z3VzdCA4LCAyMDE5IDEwOjMxIEFNCj4gPiA+PiBUbzogUGFzY2FsIFZhbiBM
ZWV1d2VuIDxwdmFubGVldXdlbkB2ZXJpbWF0cml4LmNvbT4KPiA+ID4+IENjOiBBcmQgQmllc2hl
dXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz47IGxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5l
bC5vcmc7Cj4gPiA+PiBoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU7IGFna0ByZWRoYXQuY29t
OyBzbml0emVyQHJlZGhhdC5jb207IGRtLWRldmVsQHJlZGhhdC5jb207Cj4gPiA+PiBnbWF6eWxh
bmRAZ21haWwuY29tCj4gPiA+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2Ml0gbWQvZG0tY3J5
cHQgLSByZXVzZSBlYm9pdiBza2NpcGhlciBmb3IgSVYgZ2VuZXJhdGlvbgo+ID4gPj4KPiA+ID4+
IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA0OjE0OjIyUE0gKzAwMDAsIFBhc2NhbCBWYW4gTGVl
dXdlbiB3cm90ZToKPiA+ID4+Pj4+PiBJbiB5b3VyIGNhc2UsIHdlIGFyZSBub3QgZGVhbGluZyB3
aXRoIGtub3duIHBsYWludGV4dCBhdHRhY2tzLAo+ID4gPj4+Pj4+Cj4gPiA+Pj4+PiBTaW5jZSB0
aGlzIGlzIFhUUywgd2hpY2ggaXMgdXNlZCBmb3IgZGlzayBlbmNyeXB0aW9uLCBJIHdvdWxkIGFy
Z3VlCj4gPiA+Pj4+PiB3ZSBkbyEgRm9yIHRoZSB0d2VhayBlbmNyeXB0aW9uLCB0aGUgc2VjdG9y
IG51bWJlciBpcyBrbm93biBwbGFpbnRleHQsCj4gPiA+Pj4+PiBzYW1lIGFzIGZvciBFQk9JVi4g
QWxzbywgeW91IG1heSBiZSBhYmxlIHRvIGNvbnRyb2wgZGF0YSBiZWluZyB3cml0dGVuCj4gPiA+
Pj4+PiB0byB0aGUgZGlzayBlbmNyeXB0ZWQsIGVpdGhlciBkaXJlY3RseSBvciBpbmRpcmVjdGx5
Lgo+ID4gPj4+Pj4gT0ssIHBhcnQgb2YgdGhlIGRhdGEgaW50byB0aGUgQ1RTIGVuY3J5cHRpb24g
d2lsbCBiZSBwcmV2aW91cyBjaXBoZXJ0ZXh0LAo+ID4gPj4+Pj4gYnV0IHRoYXQgbWF5IGJlIGp1
c3QgMSBieXRlIHdpdGggdGhlIHJlc3QgYmVpbmcgdGhlIGtub3duIHBsYWludGV4dC4KPiA+ID4+
Pj4+Cj4gPiA+Pj4+Cj4gPiA+Pj4+IFRoZSB0d2VhayBlbmNyeXB0aW9uIHVzZXMgYSBkZWRpY2F0
ZWQga2V5LCBzbyBsZWFraW5nIGl0IGRvZXMgbm90IGhhdmUKPiA+ID4+Pj4gdGhlIHNhbWUgaW1w
YWN0IGFzIGl0IGRvZXMgaW4gdGhlIEVCT0lWIGNhc2UuCj4gPiA+Pj4+Cj4gPiA+Pj4gV2VsbCAu
Li4geWVzIGFuZCBuby4gVGhlIHNwZWMgZGVmaW5lcyB0aGVtIGFzIHNlcGVyYXRlbHkgY29udHJv
bGxhYmxlIC0KPiA+ID4+PiBkZXZpYXRpbmcgZnJvbSB0aGUgb3JpZ2luYWwgWEVYIGRlZmluaXRp
b24gLSBidXQgaW4gbW9zdCBwcmFjdGljbGUgdXNlIGNhc2VzCj4gPiA+Pj4gSSd2ZSBzZWVuLCB0
aGUgc2FtZSBrZXkgaXMgdXNlZCBmb3IgYm90aCwgYXMgaGF2aW5nIDIga2V5cyBqdXN0IGluY3Jl
YXNlcwo+ID4gPj4+IGtleSAgc3RvcmFnZSByZXF1aXJlbWVudHMgYW5kIGRvZXMgbm90IGFjdHVh
bGx5IGltcHJvdmUgZWZmZWN0aXZlIHNlY3VyaXR5Cj4gPiA+Pj4gKG9mIHRoZSBhbGdvcml0aG0g
aXRzZWxmLCBpbXBsZW1lbnRhdGlvbiBwZWN1bGlhcml0aWVzIGxpa2UgdGhpcyBvbmUgYXNpZGUK
PiA+ID4+PiA6LSksIGFzICBYRVggaGFzIGJlZW4gcHJvdmVuIHNlY3VyZSB1c2luZyBhIHNpbmds
ZSBrZXkuIEFuZCB0aGUgc2VjdXJpdHkKPiA+ID4+PiBwcm9vZiBmb3IgWFRTIGFjdHVhbGx5IGJ1
aWxkcyBvbiB0aGF0IHdoaWxlIHVzaW5nIDIga2V5cyBkZXZpYXRlcyBmcm9tIGl0Lgo+ID4gPj4+
Cj4gPiA+Pgo+ID4gPj4gVGhpcyBpcyBhIGNvbW1vbiBtaXNjb25jZXB0aW9uLiAgQWN0dWFsbHks
IFhUUyBuZWVkcyAyIGRpc3RpbmN0IGtleXMgdG8gYmUgYQo+ID4gPj4gQ0NBLXNlY3VyZSB0d2Vh
a2FibGUgYmxvY2sgY2lwaGVyLCBkdWUgdG8gYW5vdGhlciBzdWJ0bGUgZGlmZmVyZW5jZSBmcm9t
IFhFWDoKPiA+ID4+IFhFWCAoYnkgd2hpY2ggSSByZWFsbHkgbWVhbiAiWEVYW0UsMl0iKSBidWls
ZHMgdGhlIHNlcXVlbmNlIG9mIG1hc2tzIHN0YXJ0aW5nCj4gPiA+PiB3aXRoIHheMSwgd2hpbGUg
WFRTIHN0YXJ0cyB3aXRoIHheMC4gIElmIG9ubHkgMSBrZXkgaXMgdXNlZCwgdGhlIGluY2x1c2lv
biBvZgo+ID4gPj4gdGhlIDB0aCBwb3dlciBpbiBYVFMgYWxsb3dzIHRoZSBhdHRhY2sgZGVzY3Jp
YmVkIGluIFNlY3Rpb24gNiBvZiB0aGUgWEVYIHBhcGVyCj4gPiA+PiAoaHR0cHM6Ly93ZWIuY3Mu
dWNkYXZpcy5lZHUvfnJvZ2F3YXkvcGFwZXJzL29mZnNldHMucGRmKS4KPiA+ID4+Cj4gPiA+IElu
dGVyZXN0aW5nIC4uLiBJJ20gbm90IGEgY3J5cHRvZ3JhcGhlciwganVzdCBhIGh1bWJsZSBIVyBl
bmdpbmVlciBzcGVjaWFsaXplZAo+ID4gPiBpbiBpbXBsZW1lbnRpbmcgY3J5cHRvLiBJJ20gYmFz
aW5nIG15IHZpZXdzIG1vc3RseSBvbiB0aGUgTGlza292L01pbmVtYXRzdQo+ID4gPiAiQ29tbWVu
dHMgb24gWFRTIiwgd2hvIGFzc2VydCB0aGF0IHVzaW5nIDIga2V5cyBpbiBYVFMgd2FzIG1pc2d1
aWRlZC4KPiA+ID4gKGFuZCBJIG5ldmVyIHNhdyBhbnkgZm9sbG93LW9uIGNvbW1lbnRzIGFzc2Vy
dGluZyB0aGF0IHRoaXMgdmlldyB3YXMgd3JvbmcgLi4uKQo+ID4gPiBPbiBub3QgYXZvaWRpbmcg
aj0wIGluIHRoZSBYVFMgc3BlYyB0aGV5IGFjdHVhbGx5IGNvbW1lbnQ6Cj4gPiA+ICJUaGlzIGRp
ZmZlcmVuY2UgaXMgc2lnbmlmaWNhbnQgaW4gc2VjdXJpdHksIGJ1dCBoYXMgbm8gaW1wYWN0IG9u
IGVmZmVjdGl2ZW5lc3MKPiA+ID4gZm9yIHByYWN0aWNhbCBhcHBsaWNhdGlvbnMuIiwgd2hpY2gg
SSByZWFkIGFzICJub3QgcmVsZXZhbnQgZm9yIG5vcm1hbCB1c2UiLgoKU2VlIHBhZ2UgNiBvZiAi
Q29tbWVudHMgb24gWFRTIjoKCglOb3RlIHRoYXQgaiA9IDAgbXVzdCBiZSBleGNsdWRlZCwgYXMg
ZigwLCB2KSA9IHYgZm9yIGFueSB2LCB3aGljaAoJaW1wbGllcyDPgSA9IDEuIE1vcmVvdmVyLCBp
ZiBqID0gMCB3YXMgYWxsb3dlZCwgYSBzaW1wbGUgYXR0YWNrIGJhc2VkIG9uCgl0aGlzIGZhY3Qg
ZXhpc3RlZCwgYXMgcG9pbnRlZCBvdXQgYnkgWzZdIGFuZCBbM10uIEhlbmNlIGlmIFhFWCBpcyB1
c2VkLAoJb25lIG11c3QgYmUgY2FyZWZ1bCB0byBhdm9pZCBqIGJlaW5nIDAuCgpUaGUgcGFydCB5
b3UgcXVvdGVkIGlzIG9ubHkgdGFsa2luZyBhYm91dCBYVFMgKmFzIHNwZWNpZmllZCosIGkuZS4g
d2l0aCAyIGtleXMuCgo+ID4gPgo+ID4gPiBJbiBhbnkgY2FzZSwgaXQncyBmcmVxdWVudGx5ICp1
c2VkKiB3aXRoIGJvdGgga2V5cyBiZWluZyBlcXVhbCBmb3IgcGVyZm9ybWFuY2UKPiA+ID4gYW5k
IGtleSBzdG9yYWdlIHJlYXNvbnMuCgpJdCdzIGJyb2tlbiwgc28gaXQncyBicm9rZW4uICBEb2Vz
bid0IG1hdHRlciB3aG8gaXMgdXNpbmcgaXQuCgo+ID4gCj4gPiBUaGVyZSBpcyBhbHJlYWR5IGNo
ZWNrIGluIGtlcm5lbCBmb3IgWFRTICJ3ZWFrIiBrZXlzICh0d2VhayBhbmQgZW5jcnlwdGlvbiBr
ZXlzIG11c3Qgbm90IGJlCj4gPiB0aGUgc2FtZSkuCj4gPiAKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2lu
Y2x1ZGUvY3J5cHRvL3h0cy5oIwo+ID4gbjI3Cj4gPiAKPiA+IEZvciBub3cgaXQgYXBwbGllcyBv
bmx5IGluIEZJUFMgbW9kZS4uLiAoYW5kIGlmIEkgc2VlIGNvcnJlY3RseSBpdCBpcyBkdXBsaWNh
dGVkIGluIGFsbAo+ID4gZHJpdmVycykuCj4gPiAKPiBJIG5ldmVyIGhhZCBhbnkgbmVlZCB0byBs
b29rIGludG8gRklQUyBmb3IgWFRTIGJlZm9yZSwgYnV0IHRoaXMgYWN0dWFsbHkgYXBwZWFycwo+
IHRvIGJlIGFjY3VyYXRlLiBGSVBTIGluZGVlZCAqcmVxdWlyZXMgdGhpcyouIE11Y2ggdG8gbXkg
c3VycHJpc2UsIEkgbWlnaHQgYWRkLgo+IFN0aWxsIGxvb2tpbmcgZm9yIHNvbWUgYWN0dWFsIHJh
dGlvbmFsZSB0aGF0IGdvZXMgYmV5b25kIHN1Z2dlc3Rpb24gYW5kIGlubnVlbmRvIAo+IChhbmQg
aXMgbm90IHRvbyBoZWF2eSBvbiB0aGUgbWF0aCA7LSkgdGhvdWdoLgoKQXMgSSBzYWlkLCB0aGUg
YXR0YWNrIGlzIGV4cGxhaW5lZCBpbiB0aGUgb3JpZ2luYWwgWEVYIHBhcGVyLiAgQmFzaWNhbGx5
IHRoZQphZHZlcnNhcnkgY2FuIHN1Ym1pdCBhIGNob3NlbiBjaXBoZXJ0ZXh0IHF1ZXJ5IGZvciB0
aGUgZmlyc3QgYmxvY2sgb2Ygc2VjdG9yIDAKdG8gbGVhayB0aGUgZmlyc3QgIm1hc2siIG9mIHRo
YXQgc2VjdG9yLCB0aGVuIHN1Ym1pdCBhIGNob3NlbiBwbGFpbnRleHQgb3IKY2lwaGVydGV4dCBx
dWVyeSBmb3IgdGhlIHJlbWluZGVyIG9mIHRoZSBzZWN0b3Igc3VjaCB0aGF0IHRoZXkgY2FuIHBy
ZWRpY3QgdGhlCm91dHB1dCB3aXRoIDEwMCUgY2VydGFpbnR5LiAgKFRoZSBzdGFuZGFyZCBzZWN1
cml0eSBtb2RlbCBmb3IgdHdlYWthYmxlIGJsb2NrCmNpcGhlcnMgc2F5cyB0aGUgb3V0cHV0IG11
c3QgYXBwZWFyIHJhbmRvbS4pCgotIEVyaWMKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==
