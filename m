Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 157EF263EB0
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 09:25:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-yYNJ0KslNR6LpIL-6lS6Pw-1; Thu, 10 Sep 2020 03:25:26 -0400
X-MC-Unique: yYNJ0KslNR6LpIL-6lS6Pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40921074650;
	Thu, 10 Sep 2020 07:25:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0FE1014160;
	Thu, 10 Sep 2020 07:25:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25731922E5;
	Thu, 10 Sep 2020 07:25:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A7OpJm000662 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 03:24:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1AFD92156A2D; Thu, 10 Sep 2020 07:24:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 151EE2156A30
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 07:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3816B811E7A
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 07:24:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-38-ETRgJ-zTNFaYtJJN6gUGMw-1;
	Thu, 10 Sep 2020 03:24:45 -0400
X-MC-Unique: ETRgJ-zTNFaYtJJN6gUGMw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9978BAC97;
	Thu, 10 Sep 2020 07:24:59 +0000 (UTC)
Date: Thu, 10 Sep 2020 09:24:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <20200910072442.GA3946@dell5510>
References: <20200829011427.12893-1-tusharsu@linux.microsoft.com>
	<20200901060740.GA4117@dell5510>
	<64b16589-f16a-eff0-47f3-8456853fc205@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <64b16589-f16a-eff0-47f3-8456853fc205@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08A7OpJm000662
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, zohar@linux.ibm.com, nramas@linux.microsoft.com,
	dm-devel@redhat.com, ltp@lists.linux.it,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] IMA: Add test for dm-crypt measurement
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Petr Vorel <pvorel@suse.cz>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

SGkgVHVzaGFyLAoKPiA+ID4gSU1BIHN1YnN5c3RlbSBzdXBwb3J0cyBtZWFzdXJpbmcgZGF0YSBm
cm9tIG90aGVyIGtlcm5lbCBjb21wb25lbnRzCj4gPiA+IHRocm91Z2ggZnVuYz1DUklUSUNBTF9E
QVRBIHBvbGljeSAnY3JpdGljYWxfa2VybmVsX2RhdGFfc291cmNlcycuCj4gPiA+IFRoaXMgSU1B
IHBvbGljeSBjYW4gYmUgc2V0IHRvIG1lYXN1cmUgdGhlIGRhdGEgY29taW5nIGZyb20gZGV2aWNl
LW1hcHBlcgo+ID4gPiB0YXJnZXRzLiBUaGlzIHNjZW5hcmlvIG5lZWRzIHRlc3QgY292ZXJhZ2Uu
Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgo+ID4gRmlyc3QsIHlvdSBoYXZlbid0IHNl
bmQgdGhpcyBwYXRjaCB0byBMVFAgbWFpbGluZyBsaXN0Cj4gPiAoaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHApLiBJIENjIGl0LCBwbGVhc2UgZG8gbmV4dCB0aW1lLgoKPiBBcG9s
b2dpZXMgZm9yIG15IGlnbm9yYW5jZS4KPiBJIHdpbGwgaW5jbHVkZSBpdCBuZXh0IHRpbWUuClRo
YW5rcyEgTm8gYmlnIGRlYWwgOikuCgo+ID4gPiBBZGQgYSB0ZXN0Y2FzZSB3aGljaCB2ZXJpZmll
cyB0aGF0IHRoZSBJTUEgc3Vic3lzdGVtIGNvcnJlY3RseSBtZWFzdXJlcwo+ID4gPiB0aGUgZGF0
YSBwcm92aWRlZCBieSBvbmUgc3VjaCBETSB0YXJnZXQgLSBkbS1jcnlwdC4KCj4gPiA+IFRoaXMg
c2VyaWVzIG5lZWRzIGEga2VybmVsIGJ1aWx0IG9uIHRoZSBmb2xsb3dpbmcgcmVwby9icmFuY2gv
cGF0Y2hlczoKPiA+ID4gICByZXBvOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC96b2hhci9saW51eC1pbnRlZ3JpdHkuZ2l0Cj4gPiA+ICAgYnJhbmNoOiBu
ZXh0LWludGVncml0eQo+ID4gPiAgIGNvbW1pdCBkMDEyYTcxOTBmYzEgKCJMaW51eCA1LjktcmMy
IikKCj4gPiA+IEFuZCB0aGUgZm9sbG93aW5nIHBhdGNoIHNlcmllcyBzaG91bGQgYmUgYXBwbGll
ZCBpbiB0aGUgb3JkZXIgYmVsb3c6Cj4gPiA+ICAgMS4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMTcwOTUyNy8KPiA+ID4gICAyLiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExNzQyMDQ3Lwo+ID4gPiAgIDMuIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTE3NDMyNjUvCj4gPiA+ICAgNC4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMTc0MzcxNS8KCj4gPiBUaGFua3MgZm9yIGEgZGV0YWlsZWQgaW5mby4KPiBTdXJl
LiA6KQoKLi4uCj4gPiA+ICsjIyMgSU1BIERNIHRhcmdldCAoZG0tY3J5cHQpIG1lYXN1cmVtZW50
IHRlc3QKPiA+ID4gKwo+ID4gPiArVG8gZW5hYmxlIElNQSB0byBtZWFzdXJlIGRldmljZS1tYXBw
ZXIgdGFyZ2V0IC0gZG0tY3J5cHQsCj4gPiA+ICtgaW1hX2RtX2NyeXB0LnNoYCByZXF1aXJlcyBh
IHJlYWRhYmxlIElNQSBwb2xpY3ksIGFzIHdlbGwgYXMKPiA+ID4gK2EgbG9hZGVkIG1lYXN1cmUg
cG9saWN5IHdpdGgKPiA+ID4gK2BmdW5jPUNSSVRJQ0FMX0RBVEEgY3JpdGljYWxfa2VybmVsX2Rh
dGFfc291cmNlcz1kbS1jcnlwdGAKPiA+IENvdWxkIHlvdSBwbGVhc2UgYWxzbyBjcmVhdGUgaW1h
X2RtX2NyeXB0LnBvbGljeSBmaWxlIGluCj4gPiB0ZXN0Y2FzZXMva2VybmVsL3NlY3VyaXR5L2lu
dGVncml0eS9pbWEvZGF0YWZpbGVzL2ltYV9kbV9jcnlwdC8gZGlyZWN0b3J5PwoKPiBNYXliZSBJ
IHNob3VsZCBjcmVhdGUgYSBkaXJlY3Rvcnkg4oCYaW1hX2RldmljZV9tYXBwZXLigJkgcmF0aGVy
IHRoYW4KPiDigJhpbWFfZG1fY3J5cHTigJkgLSBiZWNhdXNlIHRoZXJlIGNvdWxkIGJlIG1vcmUg
RE0gdGFyZ2V0cyBsaWtlIOKAmGNyeXB04oCZLgo+IEFuZCBJIHdpbGwgcGxhY2UgYWxsIHRoZSBk
bSB0YXJnZXQgcG9saWN5IGZpbGVzIHRoZXJlLgo+IERvZXMgaXQgc291bmQgZ29vZD8KVGhlIGRp
cmVjdG9yeSBtdXN0IGhhdmUgdGhlIHNhbWUgbmFtZSBhcyB0aGUgdGVzdCBmaWxlbmFtZSB3aXRo
b3V0IGV4dGVuc2lvbiwKYmVjYXVzZSB0aGF0IGlzICRUU1RfSUQsIHNlZSB0c3RfdGVzdC5zaDoK
CmlmIFsgLXogIiRUU1RfSUQiIF07IHRoZW4KCV90c3RfZmlsZW5hbWU9JChiYXNlbmFtZSAkMCkg
fHwgXAoJCXRzdF9icmsgVENPTkYgIkZhaWxlZCB0byBzZXQgVFNUX0lEIGZyb20gXCQwICgnJDAn
KSwgZml4IGl0IHdpdGggc2V0dGluZyBUU1RfSUQgYmVmb3JlIHNvdXJjaW5nIHRzdF90ZXN0LnNo
IgoJVFNUX0lEPSR7X3RzdF9maWxlbmFtZSUlLip9CmZpCmV4cG9ydCBUU1RfSUQ9IiRUU1RfSUQi
CgouLi4KCWV4cG9ydCBUU1RfREFUQVJPT1Q9IiRMVFBST09UL3Rlc3RjYXNlcy9kYXRhLyRUU1Rf
SUQiCgpVbmZvcnR1bmF0ZWx5IHRoYXQncyB0aGUgY3VycmVudCBsaW1pdGF0aW9uIGZvciBMVFAg
ZGF0YSBmaWxlcy4KCi4uLgo+ID4gPiArdGVzdDEoKQo+ID4gPiArewo+ID4gPiArCWxvY2FsIGRt
Y2hlY2tfbGluZXMgaSBkbV90YXJnZXRzIHRlbXBsYXRlcwo+ID4gPiArCWxvY2FsIHBvbGljeT0i
Y3JpdGljYWxfa2VybmVsX2RhdGFfc291cmNlcyIKPiA+ID4gKwlsb2NhbCBwYXR0ZXJuPSdjcml0
aWNhbF9rZXJuZWxfZGF0YV9zb3VyY2VzPVteWzpzcGFjZTpdXSsnCj4gPiA+ICsJbG9jYWwgdG1w
X2ZpbGU9InRtcC50eHQiCj4gPiA+ICsJbG9jYWwgdG9rZW5zX2ZpbGU9InRva2Vuc19maWxlLnR4
dCIgZ3JlcF9maWxlPSJncmVwX2ZpbGUudHh0Igo+ID4gPiArCWxvY2FsIGFyZyBjbWQga2V5IHRn
dF9uYW1lCj4gPiA+ICsJbG9jYWwgcmVzPTAKPiA+IG5pdDogbG9jYWwgcmVzCj4gPiBMYXRlciB5
b3UgY2FuIGNoZWNrCj4gPiBpZiBbICIkcmVzIiA9IDEgXTsgdGhlbgoKPiBJIGJlbGlldmUgSSBk
byBuZWVkIHRvIGluaXRpYWxpemUgcmVzPTAuCj4gUGxlYXNlIHNlZSBteSBjb21tZW50IGJlbG93
LgpJJ2xsIHJlcGx5IHRoZXJlLgoKLi4uCj4gPiA+ICsJZG1jaGVja19saW5lcz0kKGNhdCAkdG1w
X2ZpbGUpCj4gPiA+ICsJZG1fdGFyZ2V0cz0kKGZvciBpIGluICRkbWNoZWNrX2xpbmVzOyBkbyBl
Y2hvICIkaSIgfCBncmVwICIkcG9saWN5IiB8IFwKPiA+ID4gKwkJc2VkICJzL1wuL1xcXC4vZyIg
fCBjdXQgLWQnPScgLWYyOyBkb25lIHwgc2VkICc6YTtOOyQhYmE7cy9cbi98L2cnKQo+ID4gQWdh
aW4sIGNvcHkgcGFzdGUgZnJvbSBpbWFfa2V5cy5zaC4gQ291bGQgdGhpcyBiZSBnZW5lcmFsaXpl
ZCBhbmQgbW92ZWQgdG8KPiA+IGltYV9zZXR1cC5zaD8gU2VlIG15IGhpbnQgYmVsb3cuCj4gT2su
IEkgd2lsbCBzZWUgaG93IEkgY2FuIGdlbmVyYWxpemUgdGhpcy4gVGhhbmtzLgpUaGFua3MgYSBs
b3QhCgouLi4KPiA+IEJUVyBJIHBsYW4gdG8gc2VuZCB2MiBmb3IgaW1hX3RwbS5zaCBwYXRjaAo+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2x0cC9wYXRjaC8yMDIwMDUy
NzA3MTQzNC4yODU3NC0xLXB2b3JlbEBzdXNlLmN6Lwo+ID4gTWF5YmUgdGhpcyBjb3VsZCB1c2Ug
aXQgc29tZWhvdyBhcyB3ZWxsLCBidXQgbm90IHJlcXVpcmVkLiBNYWluIHJlYXNvbiB3YXMgdG8K
PiA+IHVzZSAkRElHRVNUX0lOREVYIChkZWZhdWx0IDQpLCB3aGljaCB3b3VsZCBoZWxwIHRvIHVz
ZSB0ZXN0cyBhbHNvIG9uIGltYV90ZW1wbGF0ZV9mbXQuCj4gPiBJbiB0aGUgZnV0dXJlLCB3aGVu
IHJlYm9vdCByZXF1aXJlbWVudCBpcyBhZGRlZCBpbnRvIExUUCBBUEkgdGhpcyBjb3VsZCBiZSB1
c2VkCj4gPiB0byB0ZXN0cyBtb3JlIHNldHVwLiBCdXQgeW91IGNhbiBpZ25vcmUgaXQgbm93LgoK
PiBPay4gSSB3aWxsIHRha2UgYSBsb29rIGF0IHlvdXIgdjIuIEJ1dCB3b27igJl0IHRha2UgYSBk
ZXBlbmRlbmN5IG9uIGl0LCBmb3IKPiB0aGUgdGltZSBiZWluZy4KKzEgVGhhbmtzISAoaXQncyBy
ZWFsbHkgbGVzcyBpbXBvcnRhbnQgdGhhbiBwcmV2aW91cyBnZW5lcmFsaXphdGlvbnMgd2l0aApp
bWFfa2V5cy5zaCkuCgouLi4KPiA+ID4gKwkJCXRzdF9yZXMgVElORk8gIlJlbW92aW5nIERNIHRh
cmdldCAkdGd0X25hbWUuIgo+ID4gPiArCQkJZG1zZXR1cCByZW1vdmUgJHRndF9uYW1lCj4gPiA+
ICsJCQlyZXR1cm4KPiA+ID4gKwkJZmkKPiA+ID4gKwo+ID4gPiArCQlpZiBbICIkYWN0X2RpZ2Vz
dCIgPSAiJGV4cF9kaWdlc3QiIF07IHRoZW4KPiA+ID4gKwkJCXJlcz0xCj4gPiBNYXliZSBhbHNv
IFRGQUlMIGFuZCByZXR1cm4gaGVyZSBpbnN0ZWFkIG9mIHVzaW5nICRyZXM/Cj4gVGhhbmtzIGZv
ciB0aGUgZmVlZGJhY2suCj4gVGhlIHdoaWxlIGxvb3AgaW52b2tlcyBhIHN1Yi1zaGVsbC4gQW5k
IHJlcz0xIHdvdWxkIG1lYW4gdGhlIGhhc2ggaXMKPiBmb3VuZCwgYW5kIEkgZmFpbCBpZiB0aGUg
aGFzaCBpcyAqbm90KiBmb3VuZCAocmVzPTApLgo+IFdpdGggdGhhdCwgaXTigJlzIGxpdHRsZSB0
cmlja3kgdG8gZG8gd2hhdCB5b3UgYXJlIHN1Z2dlc3RpbmcuIEJ1dCBJIHdpbGwgc2VlCj4gd2hh
dCBJIGNhbiBkbyB0byBzaW1wbGlmeSB0aGUgbG9naWMuCkl0J3MganVzdCBhIHNtYWxsIGRldGFp
bCwgeW91IGNhbiBpZ25vcmUgaXQuIEJ1dCB3ZSBzdGFydGVkIHRoZSBkaXNjdXNzaW9uLCB0aHVz
CmhlcmUgaXMgYW4gZXhwbGFuYXRpb246ClsgIiRyZXMiID0gMSBdIGlzIG5vdCB0cnVlIGZvciB1
bmluaXRpYWxpemVkICRyZXMuIFRoYXQgd291bGRuJ3Qgd29yayBmb3IgWyAkcmVzCi1lcSAxIF0g
YW5kIGFsc28gZGlkbid0IHdvcmsgWyAkcmVzID0gMSBdICgiYmFzaDogWzogPTogdW5hcnkgb3Bl
cmF0b3IKZXhwZWN0ZWQiKS4gVGhlIHRyaWNrIGlzIHRoYXQgPSBvcGVyYXRvciBjb21wYXJlcyBz
dGluZ3MgYnV0IGFsc28gZG9lcyBudW1lcmljCmV2YWx1YXRpb24gYW5kIGFsc28gIiR1bmluaXRp
YWxpemVkX3ZhcmlhYmxlIiBldmFsdWF0ZXMgYXMgIiIgKHVubGlrZQokdW5pbml0aWFsaXplZF92
YXJpYWJsZSAtIHdpdGhvdXQgcXVvdGVzKS4KClRodXMgaW5zdGVhZCBvZiAwIHZzLiAxIHlvdSBj
YW4gdXNlIHVuaW5pdGlhbGl6ZWQgdnMgMSAodW5saWtlIEMsIHdoZXJlIDAgdnMgMQptdXN0IGJl
IHVzZWQgZS5nLiB2YXJpYWJsZSBtdXN0IGJlIGluaXRpYWxpemVkLCB1bmxlc3MgaXQncyBzdGF0
aWMgdmFyaWFibGUKd2hpY2ggaXMgYXV0b21hdGljYWxseSBpbml0aWFsaXplZCB0byAwKS4gV2Ug
dXNlIGl0IG9mdGVuIHNoZWxsIChpbiBMVFApLCBoYXZlIGEKbG9vayBhdCB0c3RfbmV0LnNoIGFu
ZCB0c3RfdGVzdC5zaAoKS2luZCByZWdhcmRzLApQZXRyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVs

