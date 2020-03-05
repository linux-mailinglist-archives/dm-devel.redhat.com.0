Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D3F2317A26D
	for <lists+dm-devel@lfdr.de>; Thu,  5 Mar 2020 10:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583401495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BM89uJeMrmfYws192pgt+t2+D9glFGSq5BZeZLuWCdM=;
	b=VHZXlDFfHj3KDwj/ZGxwaI2yr0kxCCb4V2fGauTHulbmRWnCqnTZ7CI33RRsFoLzjSNBQe
	X7MWIiTSv2oYJXxquBJAWht1b2kXuS33zNFtQfhX5ON9QgJdT/SgbCZ8iao4ZePk6l2Dc6
	FCdl5JJUsp6iU0AamH3HgZ1i6SujSP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-udaD0DwyOE-t4FD-56d83A-1; Thu, 05 Mar 2020 04:44:53 -0500
X-MC-Unique: udaD0DwyOE-t4FD-56d83A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C438010EC;
	Thu,  5 Mar 2020 09:44:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD3F5D9C9;
	Thu,  5 Mar 2020 09:44:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78CD48174D;
	Thu,  5 Mar 2020 09:44:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0259iT8h022994 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Mar 2020 04:44:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B92B491D8F; Thu,  5 Mar 2020 09:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.43.17.55] (unknown [10.43.17.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A76EC90795;
	Thu,  5 Mar 2020 09:44:22 +0000 (UTC)
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Snitzer <snitzer@redhat.com>
References: <20200304150257.GA19885@redhat.com>
	<CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
	<20200304192335.GA24296@redhat.com>
	<CAHk-=wjdzxSGRLVHheRd1WA_FhsAMEV5pOwy08x8NaMG7ty8DQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <7493a5fb-e267-6aaa-286b-16472ac8a5ca@redhat.com>
Date: Thu, 5 Mar 2020 10:44:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjdzxSGRLVHheRd1WA_FhsAMEV5pOwy08x8NaMG7ty8DQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-block <linux-block@vger.kernel.org>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

RG5lIDA0LiAwMy4gMjAgdiAyMDozNCBMaW51cyBUb3J2YWxkcyBuYXBzYWwoYSk6Cj4gCj4gCj4g
T24gV2VkLCBNYXIgNCwgMjAyMCwgMTM6MjMgTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5j
b20gCj4gPG1haWx0bzpzbml0emVyQHJlZGhhdC5jb20+PiB3cm90ZToKPiAKPiAKPiAgICAgVGhl
c2UgdmVyc2lvbnMgYXJlIGZvciB1c2Vyc3BhY2UncyBiZW5lZml0IChiZSBpdCBsdm0yLCBjcnlw
dHNldHVwLAo+ICAgICBtdWx0aXBhdGgtdG9vbHMsIGV0YykuwqAgQnV0IHllcywgdGhlc2UgdmVy
c2lvbnMgYXJlIGJvZ3VzIGV2ZW4gZm9yCj4gICAgIHRoYXQgLS0gcHJpbWFyaWx5IGJlY2F1c2Ug
aXQgcmVxdWlyZXMgdXNlcnNwYWNlIHRvIGtub3cgd2hlbiBhCj4gICAgIHBhcnRpY3VsYXIgZmVh
dHVyZS9maXggaXQgY2FyZXMgYWJvdXQgd2FzIGludHJvZHVjZWQuwqAgSW4gYWRkaXRpb246IGlm
Cj4gICAgIGZpeGVzLCB0aGF0IGFsc28gYnVtcCB2ZXJzaW9uLCBhcmUgbWFya2VkIGZvciBzdGFi
bGVAIHRoZW4gd2UncmUgcXVpY2tseQo+ICAgICBpbiB2ZXJzaW9uaW5nIGhlbGwgLS0gd2hpY2gg
aXMgd2h5IEkgYWx3YXlzIHRyeSB0byBkZWNvdXBsZSB2ZXJzaW9uCj4gICAgIGJ1bXBzIGZyb20g
Zml4ZXMuCj4gCj4gCj4gWWVhaCwgSSB0aGluayB0aGUgZHJtIHBlb3BsZSB1c2VkIHRvIGhhdmUg
YSB2ZXJzaW9uIG51bWJlciB0b28sIGFuZCBpdCdzIG5vdCAKPiBqdXN0IGZpeGVzIGdldHRpbmcg
YmFja3BvcnRlZCB0byBzdGFibGUgLSBpdCdzIGRpc3RybyBrZXJuZWxzIHRha2luZyBjaGFuZ2Vz
IAo+IGZvciBuZXcgaGFyZHdhcmUgd2l0aG91dCB0YWtpbmcgb3RoZXIgcGFydHMgZXRjLgo+IAo+
IFNvIHRoZSB2ZXJzaW9uaW5nIGVuZHMgdXAgbm90IGV2ZXIgd29ya2luZyByZWxpYWJseSBhbnl3
YXkgLSB0aGUgc2FtZSB3YXkgdGhhdCAKPiB5b3UgY2FuJ3QgdXNlIHRoZSBrZXJuZWwgdmVyc2lv
biBudW1iZXIgdG8gZGV0ZXJtaW5lIHdoYXQgc3lzdGVtIGNhbGxzIGFyZSAKPiBhdmFpbGFibGUu
Cj4gCj4gU28gdmVyc2lvbnMgY2FuIG5vdCBldmVyIGJlIGFueXRoaW5nIG1vcmUgdGhhbiBpbmZv
cm1hdGlvbmFsLCBhbmQgaXQncyB1c3VhbGx5IAo+IGp1c3QgdmVyeSBjb25mdXNpbmcgdG8gaGF2
ZSBtdWx0aXBsZSBkaWZmZXJlbnQgdmVyc2lvbiBudW1iZXJzIChpZSAiSSdtIAo+IHJ1bm5pbmcg
a2VybmVsIHY1LjQsIGFuZCBteSBkcml2ZXIgYWJjIHZlcnNpb24gaXMgMS40LjJhIiBpcyAqbm90
KiBpbiB0aGUgCj4gbGVhc3QgaGVscGZ1bCkuCj4gCj4gICAgIE90aGVycyBoYXZlIHN1Z2dlc3Rl
ZCBzZXR0aW5nIGZlYXR1cmUgZmxhZ3MuwqAgSSBleHBlY3QgeW91J2QgaGF0ZSB0aG9zZQo+ICAg
ICB0b28uwqAgSSBzdXNwZWN0IEkgcXVpY2tseSB3b3VsZCB0b28gZ2l2ZW4gZmxhZyBiaXRzIGFy
ZSBmaW5pdGUgYW5kCj4gICAgIHJlYWxseSB0ZWRpb3VzIHRvIGRlYWwgd2l0aC4KPiAKPiAKPiBJ
dCBhbHNvIGxlYWRzIHRvIHNvbWUgcGVvcGxlIHRoZW4gdGhpbmtpbmcgaXQncyBvayB0byByZW1v
dmUgZmVhdHVyZXMgKHBlcmhhcHMgCj4gdG8gcmVpbXBsZW1lbnQgdGhlbSBkaWZmZXJlbnRseSkg
aWYgdGhleSBvbmx5IGNsZWFyIHRoZSBmZWF0dXJlIGJpdC4KPiAKPiBBbmQgbm8sIGl0J3Mgbm90
IGhvdyBrZXJuZWwgaW50ZXJmYWNlcyB3b3JrLiBXZSBrZWVwIHRoZSBpbnRlcmZhY2VzIGV2ZW4g
aWYgCj4gdGhlIGludGVybmFscyBjaGFuZ2UuCj4gCj4gU28gSSd2ZSBiZWVuIHN1Z2dlc3Rpbmcg
dGhhdCBwZW9wbGUganVzdCBmcmVlemUgdGhlIHZlcnNpb24sIG9yIHJlbW92ZSB0aGUgCj4gaW50
ZXJmYWNlIGVudGlyZWx5IGlzIHBvc3NpYmxlLgo+IAo+IEJlY2F1c2Ugb3RoZXJ3aXNlIGl0J3Mg
anVzdCBhIHNvdXJjZSBvZiBwcm9ibGVtcywgd2hlcmUgdXNlciBzcGFjZSBtaWdodCAKPiByZWZ1
c2UgdG8gZG8gc29tZXRoaW5nIHRoYXQgdGhlIGtlcm5lbCBzdXBwb3J0cyBiZWNhdXNlIG9mIHNv
bWUgc2lsbHkgdmVyc2lvbiAKPiBjaGVjay4uLgoKSGkKClBPViBvZiBsdm0yIGRldmVsb3BlciAt
IHRoZXJlIGFyZSAyIHRoaW5ncyB0byBzb2x2ZSAtIDFzdC4gaXMgdGhlIGludHJvZHVjdGlvbiAK
b2YgYSBuZXcgJ2ZlYXR1cmVzJy4gVGhlIDJuZC4gaXMgdXNhYmlsaXR5L3N0YWJpbGl0eSBvZiBj
ZXJ0YWluIHZlcnNpb24gb2YgZG0gCnRhcmdldHMgLSBzbyB3aGVuIHdlIGxhdGVyIGRpc2NvdmVy
IHNvbWUgY29tYmluYXRpb24gb2YgZGV2aWNlIHN0YWNrIGFyZSBub3QgCnNhZmUgdG8gdXNlIChj
YW4gbGVhZCB0byBzaWduaWZpY2FudCBsb3NlIG9mIHVzZXIncyBkYXRhKSBsdm0yIGFkZHMgY2hl
Y2sgZm9yIAp0aGlzLgoKVGhlIHJlYXNvbiBmb3IgY29tcGxleGl0eSBjb21lcyBmcm9tIGZhY3Qg
LSBudW1lcm91cyBkaXN0cmlidXRpb24gdXNlIHZlcnNpb24Kb2Yga2VybmVsIFguWS5aIHdoaWxl
IHRoZXkgY2FuIGhhdmUgbXVjaCBuZXcgRE0gdGFyZ2V0IHZlcnNpb24gYXMgaXQncyBtdWNoIApt
b3JlIHNpbXBsZSB0byBiYWNrcG9ydCBuZXcgRE0gaW50byBvbGRlciB2ZXJzaW9uLgoKTm90aGlu
ZyBpcyBjbGVhcmx5ICdwZXJmZWN0JywgdGhlcmUgaXMgbm8gaWRlYWwgc29sdXRpb24gdG8gY292
ZXIgYWxsIApjb21iaW5hdGlvbiBvZiBhbGwga2VybmVsIGJhY2twb3J0cyAtIGJ1dCBjdXJyZW50
IHNlcGFyYXRlIHZlcnNpb25pbmcgc3RyZWFtCm9mIERNIHRhcmdldHMgYWRkZWQgdG8ga2VybmVs
IHZlcnNpb25pbmcsIHdoaWNoIGkuZS4gbHZtMiBhbHNvIGlzIHRyYWNraW5nLCAKYWRkcyBtb3Jl
IGhpbnRzIGZvciBzYWZlIGRlY2lzaW9uIChhcyB0aGUgc2FmZXR5IG9mIHVzZXIncyBkYXRhIGlz
IHRoZSBtb3N0IAppbXBvcnRhbnQgaGVyZSkgIGFuZCBhbGxvd3MgdmFyaW91cyBkaXN0cmlidXRp
b25zIHRvICdzb21laG93IHJlYXNvbmFibHknIApoYW5kbGUgYmFja3BvcnRpbmcgb2YgYnVnZml4
ZXMuCgpTbyBpZiB0aGVyZSB3b3VsZCBiZSAnZmVhdHVyZSBmbGFnJyBsaXN0IHByb3ZpZGVkIGJ5
IERNIHRhcmdldCAtIHRoZXJlIHN0aWxsIApzaG91bGQgYmUgdmlzaWJsZSB3aGljaCB2ZXJzaW9u
IG9mIGltcGxlbWVudGVkIGZsYWcgaXMgdGhhdCAtIGFzIHdoZW4gdGhlIG5ldyAKZmVhdHVyZSBp
cyBhZGRlZCAtIGl0J3Mgbm90IGFsd2F5cyAncGVyZmVjdCcgLSBzb21ldGltZXMgd2UgZGlzY292
ZXIgcSBidWcgCnF1aXRlIGxhdGUgaW4gdGhlIHByb2Nlc3Mgb2YgbmV3IGZlYXR1cmUgaW50cm9k
dWN0aW9uIC0gc28gdGhlIHBsYWluIGZhY3QgCidmZWF0dXJlWFlaJyBpcyBwcmVzZW50IHVuZm9y
dHVuYXRlbHkgZG9lc24ndCBhbHdheXMgbWVhbiBpdCdzIHVzYWJsZS4KU29tZXRpbWVzIGV2ZW4g
J2ZpeGluZycgb25lIGJ1ZyBtYXkgaW50cm9kdWNlIGEgbmV3IHByb2JsZW0gd2UgZGlzY292ZXIg
YWdhaW4gCmxhdGVyICh0ZXN0aW5nIGNvbWJpbmF0aW9ucyBvZiBkZXZpY2Ugc3RhY2tzIGlzIHJl
YWxseSBtYWRuZXNzIG9mIGl0cyBvd24uLi4pCgoKWmRlbmVrCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

