Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA8A1EAB7D
	for <lists+dm-devel@lfdr.de>; Thu, 31 Oct 2019 09:22:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572510121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L4/4RZU3pPjQJUoB6yMrvtSa5xN/HvsELZKUbTIViJU=;
	b=NjPkCFizppFMdbJ1+E3fx3l26YhDxsqVKwmOR5vgefSuTQ67aFtP7+JYioDrkKM8OZTAfH
	UdC3d7R580268MfZP5J4cPeDmLKg9nJphIw8Fm9Z7UIGx3p9z0vLPrfSMHylLGwSb1Pqaa
	/BGl0sFDQV8F9LGn0lMJJylNbtO6xuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-4k5f-N3EPKSWWKktSkCZ9w-1; Thu, 31 Oct 2019 04:21:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359821005500;
	Thu, 31 Oct 2019 08:21:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E16851001B28;
	Thu, 31 Oct 2019 08:21:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E134518034EA;
	Thu, 31 Oct 2019 08:21:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9V8LFSc031001 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 31 Oct 2019 04:21:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CCED608A5; Thu, 31 Oct 2019 08:21:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AFFA60852;
	Thu, 31 Oct 2019 08:21:06 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EA31307D8E3;
	Thu, 31 Oct 2019 08:21:03 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 8026DFD9B8147D72A51C;
	Thu, 31 Oct 2019 16:20:59 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 31 Oct 2019 16:20:56 +0800
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "agk@redhat.com" <agk@redhat.com>, Damien Le Moal
	<Damien.LeMoal@wdc.com>, "snitzer@redhat.com" <snitzer@redhat.com>
References: <203cc4c8-b380-5b2f-c9e7-766b3f031c8c@huawei.com>
	<38d2a401ad8111ec0e6806f3e165916b18769d6d.camel@wdc.com>
From: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Message-ID: <63f060dc-d3b9-f4d1-8c86-27e75f1d1441@huawei.com>
Date: Thu, 31 Oct 2019 16:20:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <38d2a401ad8111ec0e6806f3e165916b18769d6d.camel@wdc.com>
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Thu, 31 Oct 2019 08:21:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 31 Oct 2019 08:21:05 +0000 (UTC) for IP:'45.249.212.191'
	DOMAIN:'szxga05-in.huawei.com' HELO:'huawei.com'
	FROM:'zhangxiaoxu5@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.191 szxga05-in.huawei.com
	45.249.212.191 szxga05-in.huawei.com <zhangxiaoxu5@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-zoned performance degradation after apply
 75d66ffb48efb3 ("dm zoned:, properly handle backing device failure")
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 4k5f-N3EPKSWWKktSkCZ9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

aGkgRG1pdHJ5LCB0aGFua3MgZm9yIHlvdXIgcmVwbHkuCgpJIGFsc28gdGVzdCBpdCB1c2UgdGhl
IG1haW5saW5lLCBpdCBhbHNvIHRha2VzIG1vcmUgdGhhbiAxIGhvdXJzLgpteSBtZWNoaW5lIGhh
cyA2NCBDUFVzIGNvcmUgYW5kIHRoZSBkaXNrIGlzIFNBVEEuCgp3aGVuIG1rZnMuZXh0NCwgSSBm
b3VuZCB0aGUgJ3Njc2lfdGVzdF91bml0X3JlYWR5JyBydW4gbW9yZSB0aGFuIDEwMDAgdGltZXMK
cGVyIHNlY29uZCBieSB0aGUgZGlmZmVyZW50IGt3b3JrZXIuCmFuZCBldmVyeSAnc2NzaV90ZXN0
X3VuaXRfcmVhZHknIHRha2VzIG1vcmUgdGhhbiAyMDB1cywgYW5kIHRoZSBpbnRlcnZhbApsZXNz
IHRoYW4gMjB1cy4KU28sIEkgdGhpbmsgeW91ciBndWVzcyBpcyByaWdodC4KCmJ1dCB0aGVyZSBp
cyBhbm90aGVyIHF1ZXN0aW9uLCB3aHkgNC4xOSBicmFuY2ggdGFrZXMgbW9yZSB0aGFuIDEwIGhv
dXI/Ckkgd2lsbCB3b3JrIG9uIGl0LCBpZiBhbnkgaW5mb3JtYXRpb24gYWJvdXQgaXQsIEkgd2ls
bCByZXBseSB5b3UuCgpUaGFua3MuCgpteSBzY3JpcHQ6CglkbXphZG0gLS1mb3JtYXQgL2Rldi9z
ZGkKCWVjaG8gIjAgMjE0ODUzMjIyNDAgem9uZWQgL2Rldi9zZGkiIHwgZG1zZXR1cCBjcmVhdGUg
ZG16LXNkaQoJZGF0ZTsgbWtmcy5leHQ0IC9kZXYvbWFwcGVyL2Rtei1zZGk7IGRhdGUKCm1haW5s
aW5lOgoJW3Jvb3RAbG9jYWxob3N0IH5dIyB1bmFtZSAtYQoJTGludXggbG9jYWxob3N0IDUuNC4w
LXJjNSAjMSBTTVAgVGh1IE9jdCAzMSAxMTo0MToyMCBDU1QgMjAxOSBhYXJjaDY0IGFhcmNoNjQg
YWFyY2g2NCBHTlUvTGludXgKCglUaHUgT2N0IDMxIDEzOjU4OjU1IENTVCAyMDE5Cglta2UyZnMg
MS40My42ICgyOS1BdWctMjAxNykKCURpc2NhcmRpbmcgZGV2aWNlIGJsb2NrczogZG9uZQoJQ3Jl
YXRpbmcgZmlsZXN5c3RlbSB3aXRoIDI2ODQzNTQ1NjAgNGsgYmxvY2tzIGFuZCAzMzU1NDQzMjAg
aW5vZGVzCglGaWxlc3lzdGVtIFVVSUQ6IGUwZDhlMDFlLWVmYTgtNDdmZC1hMDE5LWIxODRlNjZm
NjViMAoJU3VwZXJibG9jayBiYWNrdXBzIHN0b3JlZCBvbiBibG9ja3M6CgkJMzI3NjgsIDk4MzA0
LCAxNjM4NDAsIDIyOTM3NiwgMjk0OTEyLCA4MTkyMDAsIDg4NDczNiwgMTYwNTYzMiwgMjY1NDIw
OCwKCQk0MDk2MDAwLCA3OTYyNjI0LCAxMTIzOTQyNCwgMjA0ODAwMDAsIDIzODg3ODcyLCA3MTY2
MzYxNiwgNzg2NzU5NjgsCgkJMTAyNDAwMDAwLCAyMTQ5OTA4NDgsIDUxMjAwMDAwMCwgNTUwNzMx
Nzc2LCA2NDQ5NzI1NDQsIDE5MzQ5MTc2MzIsCgkJMjU2MDAwMDAwMAoKCUFsbG9jYXRpbmcgZ3Jv
dXAgdGFibGVzOiBkb25lCglXcml0aW5nIGlub2RlIHRhYmxlczogZG9uZQoJQ3JlYXRpbmcgam91
cm5hbCAoMjYyMTQ0IGJsb2Nrcyk6IGRvbmUKCVdyaXRpbmcgc3VwZXJibG9ja3MgYW5kIGZpbGVz
eXN0ZW0gYWNjb3VudGluZyBpbmZvcm1hdGlvbjogZG9uZQoKCVRodSBPY3QgMzEgMTU6MDE6MDEg
Q1NUIDIwMTkKCmFmdGVyIGRlbGV0ZSB0aGUgJ2NoZWNrX2V2ZW50cycgb24gbWFpbmxpbmU6Cglb
cm9vdEBsb2NhbGhvc3Qgfl0jIHVuYW1lIC1hCglMaW51eCBsb2NhbGhvc3QgNS40LjAtcmM1KyAj
MiBTTVAgVGh1IE9jdCAzMSAxNTowNzozNiBDU1QgMjAxOSBhYXJjaDY0IGFhcmNoNjQgYWFyY2g2
NCBHTlUvTGludXgKCVRodSBPY3QgMzEgMTU6MTk6NTYgQ1NUIDIwMTkKCW1rZTJmcyAxLjQzLjYg
KDI5LUF1Zy0yMDE3KQoJRGlzY2FyZGluZyBkZXZpY2UgYmxvY2tzOiBkb25lCglDcmVhdGluZyBm
aWxlc3lzdGVtIHdpdGggMjY4NDM1NDU2MCA0ayBibG9ja3MgYW5kIDMzNTU0NDMyMCBpbm9kZXMK
CUZpbGVzeXN0ZW0gVVVJRDogNzM1MTk4ZTgtOWRmMC00OWZjLWFhYTgtMjNiMDg2OWRmYTA1CglT
dXBlcmJsb2NrIGJhY2t1cHMgc3RvcmVkIG9uIGJsb2NrczoKCQkzMjc2OCwgOTgzMDQsIDE2Mzg0
MCwgMjI5Mzc2LCAyOTQ5MTIsIDgxOTIwMCwgODg0NzM2LCAxNjA1NjMyLCAyNjU0MjA4LAoJCTQw
OTYwMDAsIDc5NjI2MjQsIDExMjM5NDI0LCAyMDQ4MDAwMCwgMjM4ODc4NzIsIDcxNjYzNjE2LCA3
ODY3NTk2OCwKCQkxMDI0MDAwMDAsIDIxNDk5MDg0OCwgNTEyMDAwMDAwLCA1NTA3MzE3NzYsIDY0
NDk3MjU0NCwgMTkzNDkxNzYzMiwKCQkyNTYwMDAwMDAwCgoJQWxsb2NhdGluZyBncm91cCB0YWJs
ZXM6IGRvbmUKCVdyaXRpbmcgaW5vZGUgdGFibGVzOiBkb25lCglDcmVhdGluZyBqb3VybmFsICgy
NjIxNDQgYmxvY2tzKTogZG9uZQoJV3JpdGluZyBzdXBlcmJsb2NrcyBhbmQgZmlsZXN5c3RlbSBh
Y2NvdW50aW5nIGluZm9ybWF0aW9uOiBkb25lCgoJVGh1IE9jdCAzMSAxNTozMDo1MSBDU1QgMjAx
OQoK5ZyoIDIwMTkvMTAvMjcgMTA6NTYsIERtaXRyeSBGb21pY2hldiDlhpnpgZM6Cj4gWmhhbmcs
Cj4gCj4gSSBqdXN0IGRpZCBzb21lIHRlc3Rpbmcgb2YgdGhpcyBzY2VuYXJpbyB3aXRoIGEgcmVj
ZW50IGtlcm5lbCB0aGF0IGluY2x1ZGVzIHRoaXMgcGF0Y2guCj4gCj4gVGhlIGxvZyBiZWxvdyBp
cyBhIHJ1biBpbiBRRU1VIHdpdGggOCBDUFVzIGFuZCBpdCB0b29rIDE4LjUgbWludXRlcyB0byBj
cmVhdGUgdGhlIEZTIG9uIGEKPiAxNFRCIEFUQSBkcml2ZS4gRG9pbmcgdGhlIHNhbWUgdGhpbmcg
b24gYmFyZSBtZXRhbCB3aXRoIDMyIENQVXMgdGFrZXMgMTAuNSBtaW51dGVzIGluIG15Cj4gZW52
aXJvbm1lbnQuIEhvd2V2ZXIsIHdoZW4gZG9pbmcgdGhlIHNhbWUgdGVzdCB3aXRoIGEgU0FTIGRy
aXZlLCB0aGUgcnVuIHRha2VzIDQzIG1pbnV0ZXMuCj4gVGhpcyBpcyBub3QgcXVpdGUgdGhlIGRl
Z3JhZGF0aW9uIHlvdSBhcmUgb2JzZXJ2aW5nLCBidXQgc3RpbGwgYSBiaWcgcGVyZm9ybWFuY2Ug
aGl0Lgo+IAo+IElzIHRoZSBkaXNrIHRoYXQgeW91IGFyZSB1c2luZyBTQVMgb3IgU0FUQT8KPiAK
PiBNeSBjdXJyZW50IGd1ZXNzIGlzIHRoYXQgc2QgZHJpdmVyIG1heSBnZW5lcmF0ZSBzb21lIFRF
U1QgVU5JVCBSRUFEWSBjb21tYW5kcyB0byBjaGVjayBpZgo+IHRoZSBkcml2ZSBpcyByZWFsbHkg
b25saW5lIGFzIGEgcGFydCBvZiBjaGVja19ldmVudHMoKSBwcm9jZXNzaW5nLiBGb3IgQVRBIGRy
aXZlcywgdGhpcyBpcwo+IG5lYXJseSBhIE5PUCBzaW5jZSBhbGwgVFVScyBhcmUgY29tcGxldGVk
IGludGVybmFsbHkgaW4gbGliYXRhLiBCdXQsIGluIFNDU0kgY2FzZSwgdGhlc2UKPiBibG9ja2lu
ZyBUVVJzIGFyZSBpc3N1ZWQgdG8gdGhlIGRyaXZlIGFuZCBjZXJ0YWlubHkgbWF5IGRlZ3JhZGUg
cGVyZm9ybWFuY2UuCj4gCj4gVGhlIGNoZWNrX2V2ZW50cygpIGNhbGwgaGFzIGJlZW4gYWRkZWQg
dG8gYmRldl9kZXZpY2VfaXNfZHlpbmcoKSBiZWNhdXNlIHNpbXBseSBjYWxsaW5nCj4gYmRldl9x
dWV1ZV9keWluZygpIGRvZXNuJ3QgY292ZXIgdGhlIHNpdHVhdGlvbiB3aGVuIHRoZSBkcml2ZSBn
ZXRzIG9mZmxpbmVkIGluIFNDU0kgbGF5ZXIuCj4gSXQgbWlnaHQgYmUgcG9zc2libGUgdG8gb25s
eSBjYWxsIGNoZWNrX2V2ZW50cygpIG9uY2UgYmVmb3JlIGV2ZXJ5IHJlY2xhaW0gcnVuIGFuZCB0
byBhdm9pZAo+IGNhbGxpbmcgaXQgaW4gSS9PIG1hcHBpbmcgcGF0aC4gSWYgdGhpcyB3b3Jrcywg
dGhlIG92ZXJoZWFkIHdvdWxkIGxpa2VseSBiZSBhY2NlcHRhYmxlLgo+IEkgYW0gZ29pbmcgdG8g
dGFrZSBhIGxvb2sgaW50byB0aGlzLgo+IAo+IFJlZ2FyZHMsCj4gRG1pdHJ5Cj4gCj4gW3Jvb3RA
eHh4IGRtel0jIHVuYW1lIC1hCj4gTGludXggeHh4IDUuNC4wLXJjMS1ETVorICMxIFNNUCBGcmkg
T2N0IDExIDExOjIzOjEzIFBEVCAyMDE5IHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eAo+
IFtyb290QHh4eCBkbXpdIyBsc3Njc2kKPiBbMDowOjA6MF0gICAgZGlzayAgICBRRU1VICAgICBR
RU1VIEhBUkRESVNLICAgIDIuNSsgIC9kZXYvc2RhCj4gWzE6MDowOjBdICAgIHpiYyAgICAgQVRB
ICAgICAgSEdTVCBIU0g3MjE0MTVBTCBUMjQwICAvZGV2L3NkYgo+IFtyb290QHh4eCBkbXpdIyAu
L3NldHVwLWRteiB0ZXN0IC9kZXYvc2RiCj4gW3Jvb3RAeHh4IGRtel0jIGNhdCAvcHJvYy9rYWxs
c3ltcyB8IGdyZXAgZG16X2JkZXZfaXNfZHlpbmcKPiAoc3RhbmRhcmQgaW5wdXQpOjkwNzgyOmZm
ZmZmZmZmYzA3MGE0MDEgdCBkbXpfYmRldl9pc19keWluZy5jb2xkCVtkbV96b25lZF0KPiAoc3Rh
bmRhcmQgaW5wdXQpOjkwODQ5OmZmZmZmZmZmYzA3MDZlMTAgdCBkbXpfYmRldl9pc19keWluZwlb
ZG1fem9uZWRdCj4gW3Jvb3RAeHh4IGRtel0jIHRpbWUgbWtmcy5leHQ0IC9kZXYvbWFwcGVyL3Rl
c3QKPiBta2UyZnMgMS40NC42ICg1LU1hci0yMDE5KQo+IERpc2NhcmRpbmcgZGV2aWNlIGJsb2Nr
czogZG9uZQo+IENyZWF0aW5nIGZpbGVzeXN0ZW0gd2l0aCAzNjYwODQwOTYwIDRrIGJsb2NrcyBh
bmQgNDU3NjA1MTIwIGlub2Rlcwo+IEZpbGVzeXN0ZW0gVVVJRDogNDUzNmJhY2QtY2ZiNS00MWIy
LWIwYmYtYzI1MTNlNmUzMzYwCj4gU3VwZXJibG9jayBiYWNrdXBzIHN0b3JlZCBvbiBibG9ja3M6
Cj4gCTMyNzY4LCA5ODMwNCwgMTYzODQwLCAyMjkzNzYsIDI5NDkxMiwgODE5MjAwLCA4ODQ3MzYs
IDE2MDU2MzIsIDI2NTQyMDgsCj4gCTQwOTYwMDAsIDc5NjI2MjQsIDExMjM5NDI0LCAyMDQ4MDAw
MCwgMjM4ODc4NzIsIDcxNjYzNjE2LCA3ODY3NTk2OCwKPiAJMTAyNDAwMDAwLCAyMTQ5OTA4NDgs
IDUxMjAwMDAwMCwgNTUwNzMxNzc2LCA2NDQ5NzI1NDQsIDE5MzQ5MTc2MzIsCj4gCTI1NjAwMDAw
MDAKPiAKPiBBbGxvY2F0aW5nIGdyb3VwIHRhYmxlczogZG9uZQo+IFdyaXRpbmcgaW5vZGUgdGFi
bGVzOiBkb25lCj4gQ3JlYXRpbmcgam91cm5hbCAoMjYyMTQ0IGJsb2Nrcyk6IGRvbmUKPiBXcml0
aW5nIHN1cGVyYmxvY2tzIGFuZCBmaWxlc3lzdGVtIGFjY291bnRpbmcgaW5mb3JtYXRpb246IGRv
bmUKPiAKPiAKPiByZWFsCTE4bTMwLjg2N3MKPiB1c2VyCTBtMC4xNzJzCj4gc3lzCTBtMTEuMTk4
cwo+IAo+IAo+IE9uIFNhdCwgMjAxOS0xMC0yNiBhdCAwOTo1NiArMDgwMCwgemhhbmd4aWFveHUg
KEEpIHdyb3RlOgo+PiBIaSBhbGwsIHdoZW4gSSAnbWtmcy5leHQ0JyBvbiB0aGUgZG16IGRldmlj
ZSBiYXNlZCBvbiAxMFQgc21yIGRpc2ssCj4+IGl0IHRha2VzIG1vcmUgdGhhbiAxMCBob3VycyBh
ZnRlciBhcHBseSA3NWQ2NmZmYjQ4ZWZiMyAoImRtIHpvbmVkOgo+PiBwcm9wZXJseSBoYW5kbGUg
YmFja2luZyBkZXZpY2UgZmFpbHVyZSIpLgo+Pgo+PiBBZnRlciBkZWxldGUgdGhlICdjaGVja19l
dmVudHMnIGluICdkbXpfYmRldl9pc19keWluZycsIGl0IGp1c3QKPj4gdGFrZSBsZXNzIHRoYW4g
MTIgbWlucy4KPj4KPj4gSSB0ZXN0IGl0IGJhc2VkIG9uIDQuMTkgYnJhbmNoLgo+PiBNdXN0IHdl
IGRvIHRoZSAnY2hlY2tfZXZlbnRzJyBhdCBtYXBwaW5nIHBhdGgsIHJlY2xhaW0gb3IgbWV0YWRh
dGEgSS9PPwo+Pgo+PiBUaGFua3MuCj4+CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=

