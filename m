Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9570A7D
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 22:16:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C334FC036744;
	Mon, 22 Jul 2019 20:16:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8B261352;
	Mon, 22 Jul 2019 20:16:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DF5C41F53;
	Mon, 22 Jul 2019 20:16:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MKGKNJ014940 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 16:16:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E882919C7F; Mon, 22 Jul 2019 20:16:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25A419C6A
	for <dm-devel@redhat.com>; Mon, 22 Jul 2019 20:16:18 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8C5A308FC20
	for <dm-devel@redhat.com>; Mon, 22 Jul 2019 20:16:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x1so25731538wrr.9
	for <dm-devel@redhat.com>; Mon, 22 Jul 2019 13:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+tNPvlUqqRv8U9xKVR3tnbqA5GQ758Ecyj37sBFtlIY=;
	b=RhNMmkc9d9UHiOAON+bg/Sp7t0RI3l8EIefOCCysCFHsK2zZA4mBmcNmRHSGUxINOH
	tTVRFiu9oniFtG/QW0m8XOPl/nX1J/QYK/u3zq2yrZy8sD/hrHOD0yShVp5LjLDsT4hL
	6WSwdCHQtdsPNx9fFO9TKR3QmDFOAA9Qp6bERh1p0FoUnxVW4R4M6sQsXqm0KVztsz0b
	9YMNLgIeSpaN8uIA33Sz68oKTrt9nFcwbp2gEp4Bp+7jIRW1SwBFdalGXI/pnncx2zCu
	f3v2IODkNKh1B8LA5dH/vtUgxF/bd5fttNmcAhbTNUGNTmMCQBCc/pi2Q+aiL6RrUQIO
	ETtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+tNPvlUqqRv8U9xKVR3tnbqA5GQ758Ecyj37sBFtlIY=;
	b=LiJUldip+7+dgBadGi6XfXJJyqcHMCMAT5x0wywi6bSxUR4LTyyWKM6V+vG2AdStal
	q4cY8rZYqTt7aWAju0T69TgMhBo9vaB8t6pJmFwwKoNg0ao9eyNL4cixjAVFcMBo1jkn
	gB8gY6X4MTlvQIohqQYAqZeZSwI3p6xmMbbTbOqkVRV39387LjnLrI5Zk/aPybl88DNK
	inPFR0YJSLBzaXnFuHfWVIGRP3vG+zRrphMlSSJPSzi5d7cItSJeze/L69sq53/YSq6M
	jX4BG5w+vatuiDcUKPuS9g27+l6sTBeyLswvOw++8DrhhHakR6RdKnQE5OZY74GPViVt
	3uEQ==
X-Gm-Message-State: APjAAAVPYS8N96WS7qfvogw4rL20DNdmYRCf/kscyzq/DcZ6LhtnRfZH
	SD+hBpTCIO3Xfqz3kILW4OOoBg==
X-Google-Smtp-Source: APXvYqwaiOU8SW1tmERWoDEgVtnagnMhY9VKLoEn3z0qP9DTD8KPxqlNPEnSp8R5pNx4NM5HR/syXg==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr76696885wro.112.1563826575405;
	Mon, 22 Jul 2019 13:16:15 -0700 (PDT)
Received: from [192.168.1.116] (77.49.139.23.dsl.dyn.forthnet.gr.
	[77.49.139.23]) by smtp.gmail.com with ESMTPSA id
	x11sm29146228wmi.26.2019.07.22.13.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jul 2019 13:16:15 -0700 (PDT)
To: Heinz Mauelshagen <heinzm@redhat.com>, snitzer@redhat.com, agk@redhat.com, 
	dm-devel@redhat.com
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
	<e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
	<92afa0f6-90ac-7a3f-8d8a-78fa446fec73@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <d06576ba-2bcf-5e6f-7f4b-5dec61c807b5@arrikto.com>
Date: Mon, 22 Jul 2019 23:16:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92afa0f6-90ac-7a3f-8d8a-78fa446fec73@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 22 Jul 2019 20:16:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 22 Jul 2019 20:16:17 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 22 Jul 2019 20:16:48 +0000 (UTC)

T24gNy8xNy8xOSA1OjQxIFBNLCBIZWlueiBNYXVlbHNoYWdlbiB3cm90ZToKPiBIaSBOaWtvcywK
PiAKPiB0aGFua3MgZm9yIGVsYWJvcmF0aW5nIG9uIHRob3NlIGRldGFpbHMuCj4gCj4gSGFzaCB0
YWJsZSBjb2xsaXNpb25zLCBleGNlcHRpb24gc3RvcmUgZW50cnkgY29tbWl0IG92ZXJoZWFkLAo+
IFNTRCBjYWNoZSBmbHVzaCBpc3N1ZXMgZXRjLiBhcmUgYWxsIHZhbGlkIHBvaW50cyByZWxhdGl2
ZSB0byBwZXJmb3JtYW5jZQo+IGFuZCB3b3JrIHNldCBmb290cHJpbnRzIGluIGdlbmVyYWwuCj4g
Cj4gRG8geW91IGhhdmUgYW55IHBlcmZvcm1hbmNlIG51bWJlcnMgZm9yIHlvdXIgc29sdXRpb24g
dnMuCj4gYSBzbmFwc2hvdCBvbmUgc2hvd2luZyB0aGUgYXBwcm9hY2ggaXMgYWN0dWFsbHkgc3Vw
ZXJpb3IgaW4KPiBpbiByZWFsIGNvbmZpZ3VyYXRpb25zPwoKSGkgSGVpbnosCgpQbGVhc2Ugc2Vl
IGJlbG93IGZvciBkZXRhaWxlZCBiZW5jaG1hcmsgcmVzdWx0cy4KCj4gCj4gSSdtIGFza2luZyB0
aGlzIHBhcnRpY3VsYXJseSBpbiB0aGUgY29udGV4dCBvZiB5b3VyIHJlbWFyawo+IAo+ICJBIHdy
aXRlIHRvIGEgbm90IHlldCBoeWRyYXRlZCByZWdpb24gd2lsbCBiZSBkZWxheWVkIHVudGlsIHRo
ZSAKPiBjb3JyZXNwb25kaW5nCj4gcmVnaW9uIGhhcyBiZWVuIGh5ZHJhdGVkIGFuZCB0aGUgaHlk
cmF0aW9uIG9mIHRoZSByZWdpb24gc3RhcnRzIAo+IGltbWVkaWF0ZWx5LiIKPiAKPiB3aGljaCds
bCBjYXVzZSBhIHBvdGVudGlhbGx5IGxhcmdlIHdvcmtpbmcgc2V0IG9mIGRlbGF5ZWQgd3JpdGVz
IHVubGVzcyAKPiB0aG9zZQo+IGNvdmVyIHRoZSB3aG9sZSBldmVudHVhbGx5IGxhcmdlciB0aGFu
IDRLIHJlZ2lvbi4KPiBIb3cgZG9lcyB5b3VyICdjbG9uZScgdGFyZ2V0IHBlcmZvcm0gb24gc3Vj
aCBoZWF2eSB3cml0ZSBzaXR1YXRpb25zPwo+IAoKVGhpcyBzaXR1YXRpb24gb2NjdXJzIG9ubHkg
d2hlbiB0aGUgd3JpdGVzIGFyZSBzbWFsbGVyIHRoYW4gdGhlIHJlZ2lvbgpzaXplIG9mIGRtLWNs
b25lLiBFLmcuLCBpZiB0aGUgdXNlciBzZXRzIGEgcmVnaW9uIHNpemUgb2YgNjRLIGFuZCBpc3N1
ZXMKNEsgd3JpdGVzLgoKSW4gdGhpcyBjYXNlLCB3ZSBleHBlcmllbmNlIGEgcGVyZm9ybWFuY2Ug
ZHJvcCBkdWUgdG8gQ09XLiBUaGlzIGlzIHRydWUKX2JvdGhfIGZvciBkbS1zbmFwc2hvdCBhbmQg
ZG0tY2xvbmUgYW5kIGlzIF91bmF2b2lkYWJsZV8uCgpCdXQsIHRoZSBjb21tb24gY2FzZSB3aWxs
IGJlIHNldHRpbmcgYSByZWdpb24gc2l6ZSBlcXVhbCB0byB0aGUgZmlsZQpzeXN0ZW0gYmxvY2sg
c2l6ZSwgZS5nLiwgNEssIGFuZCB0aHVzIGF2b2lkaW5nIHRoZSBDT1cgb3ZlcmhlYWQuIE5vdGUK
dGhhdCBMVk0gc25hcHNob3RzIF9hbHJlYWR5XyB1c2UgNEsgYXMgdGhlIF9kZWZhdWx0XyBjaHVu
ayBzaXplLgoKTmV2ZXJ0aGVsZXNzLCBldmVuIGZvciBsYXJnZXIgcmVnaW9uL2NodW5rIHNpemVz
LCBkbS1jbG9uZSBvdXRwZXJmb3Jtcwp0aGUgZG0tc25hcHNob3QgYmFzZWQgc29sdXRpb24sIGFz
IGlzIGV2aWRlbnQgYnkgdGhlIGZvbGxvd2luZwpwZXJmb3JtYW5jZSBtZWFzdXJlbWVudHMuCgo+
IEluIGdlbmVyYWwsIHBlcmZvcm1hbmNlIGFuZCBzdG9yYWdlIGZvb3RwcmludCB0ZXN0IHJlc3Vs
dHMgYmFzZWQgb24gdGhlIAo+IHNhbWUgc2V0Cj4gb2YgcmVhZC93cml0ZSB0ZXN0cyBpbmNsdWRp
bmcgaGVhdnkgbG9hZHMgd2l0aCByZWdpb24gc2l6ZSB2YXJpYXRpb25zIAo+IHJ1biBvbiAnY2xv
bmUnCj4gYW5kICdzbmFwc2hvdCcgd291bGQgaGVscCB5b3VyIHBvaW50Lgo+IAo+IEhlaW56Cj4g
CgpJIHVzZWQgZmlvIHRvIHJ1biBhIHNlcmllcyBvZiByZWFkIGFuZCB3cml0ZSB0ZXN0cyB0aGF0
IGNvbXBhcmUgdGhlCnBlcmZvcm1hbmNlIG9mIGRtLWNsb25lIGFnYWluc3QgeW91ciBwcm9wb3Nl
ZCBkbS1zbmFwc2hvdCBvdmVyIGRtLXJhaWQKc29sdXRpb24uCgpJIHVzZWQgYSAzNzVHQiBzcGlu
bmluZyBkaXNrIGFzIHRoZSBvcmlnaW4gZGV2aWNlIHN0b3JpbmcgdGhlIGRhdGEgdG8gYmUKY2xv
bmVkIGFuZCBhIDM3NUdCIFNTRCBhcyB0aGUgY2xvbmUgZGV2aWNlIGFuZCBmb3Igc3RvcmluZyBi
b3RoCmRtLWNsb25lJ3MgbWV0YWRhdGEgYW5kIGRtLXNuYXBzaG90J3MgZXhjZXB0aW9ucyAoQ09X
IHNwYWNlKS4KCmRtLWNsb25lIHN0YWNrIChkbXNldHVwIGxzIC0tdHJlZSkKPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQoKY2xvbmUgKDI1NDozKQog4pSc4pSAc291cmNlLS12Zy1v
cmlnaW4tLWx2ICgyNTQ6MikKIOKUgiAg4pSU4pSAICg4OjE2KQog4pSc4pSAZGVzdC0tdmctY2xv
bmUtLWx2ICgyNTQ6MCkKIOKUgiAg4pSU4pSAICgyNTk6MCkKIOKUlOKUgGRlc3QtLXZnLW1ldGEt
LWx2ICgyNTQ6MSkKICAgIOKUlOKUgCAoMjU5OjApCgpkbS1zbmFwc2hvdCArIGRtLXJhaWQgc3Rh
Y2sgKGRtc2V0dXAgbHMgLS10cmVlKQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQoKbWlycm9ydmctc25hcCAoMjU0OjcpCiDilJzilIBtaXJyb3J2Zy1zbmFw
LWNvdyAoMjU0OjYpCiDilIIgIOKUlOKUgCAoMjU5OjApCiDilJTilIBtaXJyb3J2Zy1yYWlkMS0t
bHYtcmVhbCAoMjU0OjUpCiAgICDilJzilIBtaXJyb3J2Zy1yYWlkMS0tbHZfcmltYWdlXzEgKDI1
NDozKQogICAg4pSCICDilJTilIAgKDI1OTowKQogICAg4pSc4pSAbWlycm9ydmctcmFpZDEtLWx2
X3JtZXRhXzEgKDI1NDoyKQogICAg4pSCICDilJTilIAgKDI1OTowKQogICAg4pSc4pSAbWlycm9y
dmctcmFpZDEtLWx2X3JpbWFnZV8wICgyNTQ6MSkKICAgIOKUgiAg4pSU4pSAICg4OjE2KQogICAg
4pSU4pSAbWlycm9ydmctcmFpZDEtLWx2X3JtZXRhXzAgKDI1NDowKQogICAgICAg4pSU4pSAICg4
OjE2KQptaXJyb3J2Zy1yYWlkMS0tbHYgKDI1NDo0KQog4pSU4pSAbWlycm9ydmctcmFpZDEtLWx2
LXJlYWwgKDI1NDo1KQogICAg4pSc4pSAbWlycm9ydmctcmFpZDEtLWx2X3JpbWFnZV8xICgyNTQ6
MykKICAgIOKUgiAg4pSU4pSAICgyNTk6MCkKICAgIOKUnOKUgG1pcnJvcnZnLXJhaWQxLS1sdl9y
bWV0YV8xICgyNTQ6MikKICAgIOKUgiAg4pSU4pSAICgyNTk6MCkKICAgIOKUnOKUgG1pcnJvcnZn
LXJhaWQxLS1sdl9yaW1hZ2VfMCAoMjU0OjEpCiAgICDilIIgIOKUlOKUgCAoODoxNikKICAgIOKU
lOKUgG1pcnJvcnZnLXJhaWQxLS1sdl9ybWV0YV8wICgyNTQ6MCkKICAgICAgIOKUlOKUgCAoODox
NikKCmZpbyBjb25maWd1cmF0aW9uCj09PT09PT09PT09PT09PT09CgoxLiBSYW5kb20gUmVhZC9X
cml0ZSBsYXRlbmN5IGJlbmNobWFyawoKICBpb2VuZ2luZT1wc3luYywgYnM9NEssIG51bWpvYnM9
MSwgZGlyZWN0PTEsIHRpbWVvdXQ9OTAsIHRpbWVfYmFzZWQ9MSwKICBydz1yYW5kd3JpdGUvcmFu
ZHJlYWQKCjIuIFJhbmRvbSBSZWFkL1dyaXRlIElPUFMgYmVuY2htYXJrCgogIGlvZW5naW5lPWxp
YmFpbywgYnM9NEssIG51bWpvYnM9MSwgZGlyZWN0PTEsIGlvZGVwdGg9MzIsIHRpbWVvdXQ9OTAs
CiAgdGltZV9iYXNlZD0xLCBydz1yYW5kd3JpdGUvcmFuZHJlYWQKCjMuIFNlcXVlbnRpYWwgUmVh
ZC9Xcml0ZSBCYW5kd2lkdGgKCiAgaW9lbmdpbmU9bGliYWlvLCBicz0yNTZLLCBudW1qb2JzPTEs
IGRpcmVjdD0xLCBpb2RlcHRoPTMyLCB0aW1lb3V0PTkwLAogIHRpbWVfYmFzZWQ9MSwgcnc9d3Jp
dGUvcmVhZAoKQmFzZWxpbmUKPT09PT09PT0KCkFzIGEgcmVmZXJlbmNlLCB0aGUgYmVuY2htYXJr
IHJlc3VsdHMgZm9yIHRoZSByYXcgZGV2aWNlczoKCistLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLSsKfCBkZXZpY2UgfCByYW5kLXdy
aXRlIGxhdGVuY3kgfCByYW5kLXdyaXRlIElPUFMgfCBzZXEtd3JpdGUgQlcgfAorLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0rCnwg
IEhERCAgIHwgICAgICA3MDEgdXNlYyAgICAgIHwgICAgICAgMTQyNSAgICAgIHwgICAxMjAgTUIv
cyAgIHwKfCAgU1NEICAgfCAgICAgNzIuNiB1c2VjICAgICAgfCAgICAgIDY0NDkwICAgICAgfCAg
IDM5MCBNQi9zICAgfAorLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0rCgorLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCnwgZGV2aWNlIHwgcmFuZC1yZWFkIGxhdGVuY3kg
fCByYW5kLXJlYWQgSU9QUyB8IHNlcS1yZWFkIEJXIHwKKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwp8ICBIREQgICB8ICAgICAgMS40
IG1zZWMgICAgIHwgICAgICA3MTIgICAgICAgfCAgIDEyMCBNQi9zICB8CnwgIFNTRCAgIHwgICAg
ICAxMjIgdXNlYyAgICAgfCAgICAgMTUwOTIwICAgICB8ICAgNzAxIE1CL3MgIHwKKy0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwoKZG0t
Y2xvbmUgdnMgZG0tc25hcHNob3QrZG0tcmFpZAo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CgpMYXRlbmN5IGJlbmNobWFyawotLS0tLS0tLS0tLS0tLS0tLQoKMS4gUmFuZG9tIHdyaXRl
IGxhdGVuY3kKCistLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0r
CnwgcmVnaW9uL2NodW5rIHNpemUgfCAgZG0tY2xvbmUgfCBkbS1zbmFwc2hvdCB8CistLS0tLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCnwgICAgICAgIDQgS0IgICAg
ICAgfCA3NS43IHVzZWMgfCAgIDYuOCBtc2VjICB8CnwgICAgICAgIDggS0IgICAgICAgfCAgMS45
IG1zZWMgfCAgMTcuNyBtc2VjICB8CnwgICAgICAgMTYgS0IgICAgICAgfCAgMi4xIG1zZWMgfCAg
MTUuOCBtc2VjICB8CnwgICAgICAgMzIgS0IgICAgICAgfCAgMi4yIG1zZWMgfCAgMzMuNiBtc2Vj
ICB8CnwgICAgICAgNjQgS0IgICAgICAgfCAgMi42IG1zZWMgfCAgMzEuMiBtc2VjICB8CnwgICAg
ICAgMTI4IEtCICAgICAgfCAgMy44IG1zZWMgfCAgMzUuNyBtc2VjICB8CistLS0tLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCgoqIGRtLXNuYXBzaG90K2RtLXJhaWQg
aGFzIDcuNSB0byA5MCB0aW1lcyBfbW9yZV8gd3JpdGUgbGF0ZW5jeSB0aGFuCiAgZG0tY2xvbmUu
CgoqIEZvciB0aGUgY29tbW9uIGNhc2Ugb2YgYSA0IEtCIHJlZ2lvbi9jaHVuayBzaXplLCBkbS1j
bG9uZSBoYXMgbWluaW1hbAogIG92ZXJoZWFkIG92ZXIgdGhlIFNTRCBkZXZpY2UuCgoqIEV2ZW4g
Zm9yIHJlZ2lvbi9jaHVuayBzaXplcyBncmVhdGVyIHRoYW4gNEtCIGRtLWNsb25lJ3Mgb3Zlcmhl
YWQgaXMKICBtaW5pbWFsIGNvbXBhcmVkIHRvIGRtLXNuYXBzaG90K2RtLXJhaWQuCgoyLiBSYW5k
b20gcmVhZCBsYXRlbmN5CgorLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0rCnwgcmVnaW9uL2NodW5rIHNpemUgfCBkbS1jbG9uZSB8IGRtLXNuYXBzaG90IHwKKy0t
LS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwp8ICAgICAgICA0IEtC
ICAgICAgIHwgMS41IG1zZWMgfCAgMTAuNyBtc2VjICB8CnwgICAgICAgIDggS0IgICAgICAgfCAx
LjUgbXNlYyB8ICAgOS43IG1zZWMgIHwKfCAgICAgICAxNiBLQiAgICAgICB8IDEuNSBtc2VjIHwg
IDExLjkgbXNlYyAgfAp8ICAgICAgIDMyIEtCICAgICAgIHwgMS41IG1zZWMgfCAgMjguNiBtc2Vj
ICB8CnwgICAgICAgNjQgS0IgICAgICAgfCAxLjUgbXNlYyB8ICAyNy41IG1zZWMgIHwKfCAgICAg
ICAxMjggS0IgICAgICB8IDEuNSBtc2VjIHwgIDI3LjMgbXNlYyAgfAorLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCgoqIGRtLXNuYXBzaG90K2RtLXJhaWQgaGFz
IDYuNSB0byAxOSB0aW1lcyBfbW9yZV8gcmVhZCBsYXRlbmN5IHRoYW4KICBkbS1jbG9uZS4KCiog
Rm9yIGFsbCByZWdpb24vY2h1bmsgc2l6ZXMgZG0tY2xvbmUgaGFzIG1pbmltYWwgb3ZlcmhlYWQg
b3ZlciB0aGUgSERECiAgZGV2aWNlLgoKSU9QUyBiZW5jaG1hcmsKLS0tLS0tLS0tLS0tLS0KCjEu
IFJhbmRvbSB3cml0ZSBJT1BTCgorLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0rCnwgcmVnaW9uL2NodW5rIHNpemUgfCBkbS1jbG9uZSB8IGRtLXNuYXBzaG90IHwK
Ky0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwp8ICAgICAgICA0
IEtCICAgICAgIHwgIDYyMzQ3ICAgfCAgICAgMzc1OCAgICB8CnwgICAgICAgIDggS0IgICAgICAg
fCAgIDY5NiAgICB8ICAgICAzODggICAgIHwKfCAgICAgICAxNiBLQiAgICAgICB8ICAgNjY3ICAg
IHwgICAgIDIxNyAgICAgfAp8ICAgICAgIDMyIEtCICAgICAgIHwgICA2MTQgICAgfCAgICAgMjA3
ICAgICB8CnwgICAgICAgNjQgS0IgICAgICAgfCAgIDUzMSAgICB8ICAgICAxODYgICAgIHwKfCAg
ICAgICAxMjggS0IgICAgICB8ICAgNDE3ICAgIHwgICAgIDE1OSAgICAgfAorLS0tLS0tLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCgoqIGRtLWNsb25lIGFjaGlldmVzIDEu
OCB0byAxNi42IHRpbWVzIF9tb3JlXyBJT1BTIHRoYW4KICBkbS1zbmFwc2hvdCtkbS1yYWlkLgoK
KiBGb3IgdGhlIGNvbW1vbiBjYXNlIG9mIGEgNCBLQiByZWdpb24vY2h1bmsgc2l6ZSwgZG0tY2xv
bmUgaGFzIG1pbmltYWwKICBvdmVyaGVhZCBvdmVyIHRoZSBTU0QgZGV2aWNlLgoKKiBFdmVuIGZv
ciByZWdpb24vY2h1bmsgc2l6ZXMgZ3JlYXRlciB0aGFuIDRLQiBkbS1jbG9uZSBhY2hpZXZlcwog
IHNpZ25pZmljYW50bHkgbW9yZSBJT1BTIHRoYW4gZG0tc25hcHNob3QrZG0tcmFpZC4KCjIuIFJh
bmRvbSByZWFkIElPUFMKCistLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLSsKfCByZWdpb24vY2h1bmsgc2l6ZSB8IGRtLWNsb25lIHwgZG0tc25hcHNob3QgfAorLS0t
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCnwgICAgICAgIDQgS0Ig
ICAgICAgfCAgIDc2NyAgICB8ICAgICA2ODAgICAgIHwKfCAgICAgICAgOCBLQiAgICAgICB8ICAg
NzE0ICAgIHwgICAgIDY3NyAgICAgfAp8ICAgICAgIDE2IEtCICAgICAgIHwgICA3MTUgICAgfCAg
ICAgMzM4ICAgICB8CnwgICAgICAgMzIgS0IgICAgICAgfCAgIDcxNyAgICB8ICAgICAzMzggICAg
IHwKfCAgICAgICA2NCBLQiAgICAgICB8ICAgNzIwICAgIHwgICAgIDMzOCAgICAgfAp8ICAgICAg
IDEyOCBLQiAgICAgIHwgICA3MjQgICAgfCAgICAgMzM5ICAgICB8CistLS0tLS0tLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSsKCiogZG0tY2xvbmUgYWNoaWV2ZXMgMS4xIHRv
IDIuMSB0aW1lcyBfbW9yZV8gSU9QUyB0aGFuCiAgZG0tc25hcHNob3QrZG0tcmFpZC4KCkJhbmR3
aWR0aCBiZW5jaG1hcmsKLS0tLS0tLS0tLS0tLS0tLS0tLQoKMS4gU2VxdWVudGlhbCB3cml0ZSBC
VwoKKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCnwgcmVn
aW9uL2NodW5rIHNpemUgfCAgZG0tY2xvbmUgIHwgZG0tc25hcHNob3QgfAorLS0tLS0tLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSsKfCAgICAgICAgNCBLQiAgICAgICB8
IDM4OS40IE1CL3MgfCAgMTM1LjMgTUIvcyB8CnwgICAgICAgIDggS0IgICAgICAgfCAzOTAuNSBN
Qi9zIHwgIDIzMS43IE1CL3MgfAp8ICAgICAgIDE2IEtCICAgICAgIHwgMzkwLjUgTUIvcyB8ICAy
MTMuMSBNQi9zIHwKfCAgICAgICAzMiBLQiAgICAgICB8IDM5MC40IE1CL3MgfCAgMjE0LjAgTUIv
cyB8CnwgICAgICAgNjQgS0IgICAgICAgfCAzOTAuMyBNQi9zIHwgIDIxNC4wIE1CL3MgfAp8ICAg
ICAgIDEyOCBLQiAgICAgIHwgMzkwLjUgTUIvcyB8ICAyMTEuMyBNQi9zIHwKKy0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCgoqIGRtLWNsb25lIGFjaGlldmVz
IDEuNyB0byAyLjkgdGltZXMgbW9yZSB3cml0ZSBCVyB0aGFuCiAgZG0tc25hcHNob3QrZG0tcmFp
ZC4KCiogRm9yIGFsbCByZWdpb24vY2h1bmsgc2l6ZXMgZG0tY2xvbmUgYWNoaWV2ZXMgdGhlIHNh
bWUgd3JpdGUgQlcgYXMgdGhlCiAgU1NEIGRldmljZS4KCjIuIFNlcXVlbnRpYWwgcmVhZCBCVwoK
Ky0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCnwgcmVnaW9u
L2NodW5rIHNpemUgfCAgZG0tY2xvbmUgIHwgZG0tc25hcHNob3QgfAorLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSsKfCAgICAgICAgNCBLQiAgICAgICB8IDQ0
Mi44IE1CL3MgfCAgMjE3LjMgTUIvcyB8CnwgICAgICAgIDggS0IgICAgICAgfCA0NDMuOCBNQi9z
IHwgIDI4OC44IE1CL3MgfAp8ICAgICAgIDE2IEtCICAgICAgIHwgNDQzLjggTUIvcyB8ICAyNzUu
MyBNQi9zIHwKfCAgICAgICAzMiBLQiAgICAgICB8IDQ0My44IE1CL3MgfCAgMjc2LjEgTUIvcyB8
CnwgICAgICAgNjQgS0IgICAgICAgfCA0NDMuNiBNQi9zIHwgIDI3Ni4xIE1CL3MgfAp8ICAgICAg
IDEyOCBLQiAgICAgIHwgNDQzLjYgTUIvcyB8ICAyNzUuMiBNQi9zIHwKKy0tLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0rCgoqIGRtLWNsb25lIGFjaGlldmVzIDEu
NSB0byAyIHRpbWVzIG1vcmUgcmVhZCBCVyB0aGFuCiAgZG0tc25hcHNob3QrZG0tcmFpZC4KCk1l
dGFkYXRhL1N0b3JhZ2Ugb3ZlcmhlYWQKPT09PT09PT09PT09PT09PT09PT09PT09PQoKZG0tY2xv
bmUgaGFkIGEgX21heGltdW1fIG1ldGFkYXRhIG92ZXJoZWFkIG9mIGFyb3VuZCAyMCBNQiBmb3Ig
YWxsCmJlbmNobWFya3MuIEFzIGRtLWNsb25lIGRvZXNuJ3QgcmVxdWlyZSBhbnkgZXh0cmEgQ09X
IHNwYWNlIGZvcgp0ZW1wb3JhcmlseSBzdG9yaW5nIHRoZSB3cml0dGVuIGRhdGEgKHdyaXRlcyBq
dXN0IGdvIGRpcmVjdGx5IHRvIHRoZQpjbG9uZSBkZXZpY2UpIHRoaXMgaXMgdGhlIF9vbmx5XyBz
dG9yYWdlIG92ZXJoZWFkIGluY3VycmVkIGJ5IGRtLWNsb25lLAppcnJlc3BlY3RpdmUgb2YgdGhl
IGFtb3VudCBvZiB0aGUgd3JpdHRlbiBkYXRhCgpPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIENPVyBz
cGFjZSB1dGlsaXphdGlvbiBvZiBkbS1zbmFwc2hvdCwgZm9yIHRoZQpiYW5kd2lkdGggYmVuY2ht
YXJrcywgdmFyaWVkIGZyb20gMTEuOTUgR0IgdG8gMjAuNDEgR0IsIGRlcGVuZGluZyBvbiB0aGUK
YW1vdW50IG9mIHdyaXR0ZW4gZGF0YS4KCkkgd2FudCB0byBlbXBoYXNpemUgdGhhdCBhZnRlciB0
aGUgY2xvbmluZy9zeW5jaW5nIGlzIGNvbXBsZXRlIHdlIGhhdmUKdG8gbWVyZ2UgdGhpcyBtdWx0
aS1naWdhYnl0ZSBDT1cgc3BhY2UgYmFjayB0byB0aGUgY2xvbmUvZGVzdGluYXRpb24KZGV2aWNl
LiBUaGlzIHdpbGwgY2F1c2UgX2Z1cnRoZXJfIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLCB3aGlj
aCBpcwpfbm90XyByZWZsZWN0ZWQgaW4gdGhlIGFib3ZlIHBlcmZvcm1hbmNlIG1lYXN1cmVtZW50
cywgYnV0IF93aWxsXyBiZQpwcmVzZW50IGluIHJlYWwgd29ya2xvYWRzLCBpZiB0aGUgZG0tc25h
cHNob3QgYmFzZWQgc29sdXRpb24gaXMgdXNlZC4KCgpUbyBzdW1tYXJpemUsIGRtLWNsb25lIHBl
cmZvcm1zIF9zaWduaWZpY2FudGx5XyBiZXR0ZXIgdGhhbiBhCmRtLXNuYXBzaG90IGJhc2VkIHNv
bHV0aW9uLCBvbiBhbGwgYXNwZWN0cyAobGF0ZW5jeSwgSU9QUywgQlcpLCBhbmQgd2l0aAphIF9m
cmFjdGlvbl8gb2YgdGhlIHN0b3JhZ2UvbWV0YWRhdGEgb3ZlcmhlYWQuCgpJZiB5b3UgaGF2ZSBh
bnkgbW9yZSBxdWVzdGlvbnMsIEkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRvIGRpc2N1c3MK
dGhlbSB3aXRoIHlvdS4KClRoYW5rcywKTmlrb3MKCj4gT24gNy8xMC8xOSA4OjQ1IFBNLCBOaWtv
cyBUc2lyb25pcyB3cm90ZToKPj4gT24gNy8xMC8xOSAxMjoyOCBBTSwgSGVpbnogTWF1ZWxzaGFn
ZW4gd3JvdGU6Cj4+PiBIaSBOaWtvcywKPmU+Cj4+PiB3aGF0IGlzIHRoZSBjcnVjaWFsIGZhY3Rv
ciB5b3VyIHRhcmdldCBvZmZlcnMgdnMuIHJlc3luY2hyb25pemluZyBzdWNoIGEKPj4+IGxhdGVu
Y3kgZGlzdGluY3QKPj4+IDItbGVnZ2VkIG1pcnJvciB3aXRoIGEgcmVhZC13cml0ZSBzbmFwc2hv
dCAobG9jYWwsIGZhc3QgZXhjZXB0aW9uIHN0b3JlKQo+Pj4gb24gdG9wLCB0ZWFyaW5nIHRoZQo+
Pj4gbWlycm9yIGRvd24ga2VlcGluZyB0aGUgbG9jYWwgbGVnIG9uY2UgZnVsbHkgaW4gc3luYyBh
bmQgbWVyZ2luZyB0aGUKPj4+IHNuYXBzaG90IGJhY2sgaW50byBpdD8KPj4+Cj4+PiBIZWluego+
Pj4KPj4gSGkgSGVpbnosCj4+Cj4+IFRoZSBtb3N0IHNpZ25pZmljYW50IGJlbmVmaXRzIG9mIGRt
LWNsb25lIG92ZXIgdGhlIHNvbHV0aW9uIHlvdSBwcm9wb3NlCj4+IGlzIHNpZ25pZmljYW50bHkg
YmV0dGVyIHBlcmZvcm1hbmNlLCBubyBuZWVkIGZvciBleHRyYSBDT1cgc3BhY2UsIG5vCj4+IG5l
ZWQgdG8gbWVyZ2UgYmFjayBhIHNuYXBzaG90LCBhbmQgdGhlIGFiaWxpdHkgdG8gc2tpcCBzeW5j
aW5nIHRoZQo+PiB1bnVzZWQgc3BhY2Ugb2YgYSBmaWxlIHN5c3RlbS4KPj4KPj4gMS4gSW4gb3Jk
ZXIgdG8gZW5zdXJlIHNuYXBzaG90IGNvbnNpc3RlbmN5LCBkbS1zbmFwc2hvdCBuZWVkcyB0bwo+
PiAgICAgY29tbWl0IGEgY29tcGxldGVkIGV4Y2VwdGlvbiwgYmVmb3JlIHNpZ25hbGluZyB0aGUg
Y29tcGxldGlvbiBvZiB0aGUKPj4gICAgIHdyaXRlIHRoYXQgdHJpZ2dlcmVkIGl0IHRvIHVwcGVy
IGxheWVycy4KPj4KPj4gICAgIFRoZSBwZXJzaXN0ZW50IGV4Y2VwdGlvbiBzdG9yZSBjb21taXRz
IGV4Y2VwdGlvbnMgZXZlcnkgdGltZSBhCj4+ICAgICBtZXRhZGF0YSBhcmVhIGlzIGZpbGxlZCBv
ciB3aGVuIHRoZXJlIGFyZSBubyBtb3JlIGV4Y2VwdGlvbnMKPj4gICAgIGluLWZsaWdodC4gRm9y
IGEgNEsgY2h1bmsgc2l6ZSB3ZSBoYXZlIDI1NiBleGNlcHRpb25zIHBlciBtZXRhZGF0YQo+PiAg
ICAgYXJlYSwgc28gdGhlIGJlc3QgY2FzZSBzY2VuYXJpbyBpcyBvbmUgY29tbWl0IHBlciAyNTYg
d3JpdGVzLiBIZXJlIEkKPj4gICAgIGFzc3VtZSBhIHdyaXRlIHdpdGggc2l6ZSBlcXVhbCB0byB0
aGUgY2h1bmsgc2l6ZSBvZiBkbS1zbmFwc2hvdCwKPj4gICAgIGUuZy4sIDRLLCBzbyB0aGVyZSBp
cyBubyBDT1cgb3ZlcmhlYWQsIGFuZCB0aGF0IHdlIHdyaXRlIHRvIG5ldwo+PiAgICAgY2h1bmtz
LCBzbyB3ZSBuZWVkIHRvIGFsbG9jYXRlIG5ldyBleGNlcHRpb25zLgo+Pgo+PiAgICAgUGFydCBv
ZiBjb21taXR0aW5nIHRoZSBtZXRhZGF0YSBpcyBmbHVzaGluZyB0aGUgY2FjaGUgb2YgdGhlCj4+
ICAgICB1bmRlcmx5aW5nIGRldmljZSwgaWYgdGhlcmUgaXMgb25lLiBXZSBoYXZlIHNlZW4gU1NE
cyB3aGljaCBjYW4KPj4gICAgIHN1c3RhaW4gaHVuZHJlZHMgb2YgdGhvdXNhbmRzIG9mIHJhbmRv
bSB3cml0ZSBJT1BTLCBidXQgdGhleSB0YWtlIHVwCj4+ICAgICB0byA4bXMgdG8gZmx1c2ggdGhl
aXIgY2FjaGUuIEluIHN1Y2ggYSBjYXNlLCBmbHVzaGluZyB0aGUgU1NEIGNhY2hlCj4+ICAgICBl
dmVyeSBmZXcgd3JpdGVzIHNpZ25pZmljYW50bHkgZGVncmFkZXMgcGVyZm9ybWFuY2UuCj4+Cj4+
ICAgICBNb3Jlb3ZlciwgZG0tc25hcHNob3QgZm9yY2VzIGV4Y2VwdGlvbnMgdG8gY29tcGxldGUg
aW4gdGhlIG9yZGVyIHRoZXkKPj4gICAgIHdlcmUgYWxsb2NhdGVkLCB0byBhdm9pZCBzbmFwc2hv
dCBzcGFjZSBsZWFrIG9uIGNyYXNoIChjb21taXQKPj4gICAgIDIzMGM4M2FmZGQ5Y2QpLiBUaGlz
IGluc2VydHMgZnVydGhlciBsYXRlbmN5IGluIGV4Y2VwdGlvbiBjb21wbGV0aW9ucwo+PiAgICAg
YW5kIHRodXMgdXNlciB3cml0ZSBjb21wbGV0aW9ucy4KPj4KPj4gICAgIE9uIHRoZSBvdGhlciBo
YW5kLCB3aGVuIGNsb25pbmcgYSBkZXZpY2Ugd2UgZG9uJ3QgbmVlZCB0byBiZSBzbwo+PiAgICAg
c3RyaWN0IGFuZCBjYW4gcmVseSBvbiBjb21taXR0aW5nIHRoZSBtZXRhZGF0YSBldmVyeSB0aW1l
IGEgRkxVU0ggb3IKPj4gICAgIEZVQSBiaW8gaXMgd3JpdHRlbiwgb3IgcGVyaW9kaWNhbGx5LCBs
aWtlIGRtLXRoaW4gYW5kIGRtLWNhY2hlIGRvLgo+Pgo+PiAgICAgZG0tY2xvbmUgZG9lcyBleGFj
dGx5IHRoYXQuIFdoZW4gYSByZWdpb24vY2h1bmsgaXMgY2xvbmVkIG9yCj4+ICAgICBvdmVyLXdy
aXR0ZW4gYnkgYSB3cml0ZSwgd2UganVzdCBzZXQgYSBiaXQgaW4gdGhlIHJlbGV2YW50IGluLWNv
cmUKPj4gICAgIGJpdG1hcC4gVGhlIG1ldGFkYXRhIGFyZSBjb21taXR0ZWQgb25jZSBldmVyeSBz
ZWNvbmQgb3Igd2hlbiB3ZQo+PiAgICAgcmVjZWl2ZSBhIEZMVVNIIG9yIEZVQSBiaW8uCj4+Cj4+
ICAgICBUaGlzIGltcHJvdmVzIHBlcmZvcm1hbmNlIHNpZ25pZmljYW50bHkgYW5kIHJlc3VsdHMg
aW4gaW5jcmVhc2VkIElPUFMKPj4gICAgIGFuZCByZWR1Y2VkIGxhdGVuY3ksIGVzcGVjaWFsbHkg
aW4gY2FzZXMgd2hlcmUgZmx1c2hpbmcgdGhlIGRpc2sKPj4gICAgIGNhY2hlIGlzIHZlcnkgZXhw
ZW5zaXZlLgo+Pgo+PiAyLiBGb3IgbGFyZ2UgZGV2aWNlcywgZS5nLiBtdWx0aSB0ZXJhYnl0ZSBk
aXNrcywgcmVzeW5jaHJvbml6aW5nIHRoZQo+PiAgICAgbG9jYWwgbGVnIGNhbiB0YWtlIGEgbG90
IG9mIHRpbWUuIElmIHRoZSBhcHBsaWNhdGlvbiBydW5uaW5nIG92ZXIgdGhlCj4+ICAgICBsb2Nh
bCBkZXZpY2UgaXMgd3JpdGUtaGVhdnksIGRtLXNuYXBzaG90IHdpbGwgZW5kIHVwIGFsbG9jYXRp
bmcgYQo+PiAgICAgbGFyZ2UgbnVtYmVyIG9mIGV4Y2VwdGlvbnMuIFRoaXMgaW5jcmVhc2VzIHRo
ZSBudW1iZXIgb2YgaGFzaCB0YWJsZQo+PiAgICAgY29sbGlzaW9ucyBhbmQgdGh1cyBpbmNyZWFz
ZXMgdGhlIHRpbWUgd2UgbmVlZCB0byBkbyBhIGhhc2ggdGFibGUKPj4gICAgIGxvb2t1cC4KPj4K
Pj4gICAgIGRtLXNuYXBzaG90IG5lZWRzIHRvIGxvb2sgdXAgdGhlIGV4Y2VwdGlvbiBoYXNoIHRh
YmxlcyBpbiBvcmRlciB0bwo+PiAgICAgc2VydmljZSBhbiBJL08sIHNvIHRoaXMgaW5jcmVhc2Vz
IGxhdGVuY3kgYW5kIGRlZ3JhZGVzIHBlcmZvcm1hbmNlLgo+Pgo+PiAgICAgT24gdGhlIG90aGVy
IGhhbmQsIGRtLWNsb25lIGlzIGp1c3QgdGVzdGluZyBhIGJpdCB0byBzZWUgaWYgYSByZWdpb24K
Pj4gICAgIGlzIGNsb25lZCBvciBub3QgYW5kIGRlY2lkZXMgd2hhdCB0byBkbyBiYXNlZCBvbiB0
aGF0IHRlc3QuCj4+Cj4+IDMuIFdpdGggZG0tY2xvbmUgdGhlcmUgaXMgbm8gbmVlZCB0byByZXNl
cnZlIGV4dHJhIENPVyBzcGFjZSBmb3IKPj4gICAgIHRlbXBvcmFyaWx5IHN0b3JpbmcgdGhlIHdy
aXR0ZW4gZGF0YSwgd2hpbGUgdGhlIGNsb25lIGRldmljZSBpcwo+PiAgICAgc3luY2luZy4gTm9y
IHdvdWxkIG9uZSBuZWVkIHRvIHdvcnJ5IGFib3V0IG1vbml0b3JpbmcgYW5kIGV4cGFuZGluZwo+
PiAgICAgdGhlIENPVyBkZXZpY2UgdG8gcHJldmVudCBpdCBmcm9tIGZpbGxpbmcgdXAuCj4+Cj4+
IDQuIFdpdGggZG0tY2xvbmUgdGhlcmUgaXMgbm8gbmVlZCB0byBtZXJnZSBiYWNrIHBvdGVudGlh
bGx5IHNldmVyYWwKPj4gICAgIGdpZ2FieXRlcyBvbmNlIGNsb25pbmcvc3luY2luZyBjb21wbGV0
ZXMuIFdlIGFsc28gYXZvaWQgdGhlIHJlbGV2YW50Cj4+ICAgICBwZXJmb3JtYW5jZSBkZWdyYWRh
dGlvbiBpbmN1cnJlZCBieSB0aGUgbWVyZ2luZyBwcm9jZXNzLiBXcml0ZXMganVzdAo+PiAgICAg
Z28gZGlyZWN0bHkgdG8gdGhlIGNsb25lIGRldmljZS4KPj4KPj4gNS4gZG0tY2xvbmUgaW1wbGVt
ZW50cyBzdXBwb3J0IGZvciBkaXNjYXJkcywgc28gaXQgY2FuIHNraXAKPj4gICAgIGNsb25pbmcv
c3luY2luZyB0aGUgcmVsZXZhbnQgcmVnaW9ucy4gSW4gdGhlIGNhc2Ugb2YgYSBsYXJnZSBibG9j
awo+PiAgICAgZGV2aWNlIHdoaWNoIGNvbnRhaW5zIGEgZmlsZXN5c3RlbSB3aXRoIGVtcHR5IHNw
YWNlLCBlLmcuIGEgMlRCCj4+ICAgICBkZXZpY2UgY29udGFpbmluZyA1MDBHQiBvZiB1c2VmdWwg
ZGF0YSBpbiBhIGZpbGVzeXN0ZW0sIHRoaXMgY2FuCj4+ICAgICBzaWduaWZpY2FudGx5IHJlZHVj
ZSB0aGUgdGltZSBuZWVkZWQgdG8gc3luYy9jbG9uZS4KPj4KPj4gVGhpcyB3YXMgYSByYXRoZXIg
bG9uZyBlbWFpbCwgYnV0IEkgaG9wZSBpdCBtYWtlcyB0aGUgc2lnbmlmaWNhbnQKPj4gYmVuZWZp
dHMgb2YgZG0tY2xvbmUgb3ZlciB1c2luZyBkbS1zbmFwc2hvdCwgYW5kIG91ciByYXRpb25hbGUg
YmVoaW5kCj4+IHRoZSBkZWNpc2lvbiB0byBpbXBsZW1lbnQgYSBuZXcgdGFyZ2V0IGNsZWFyZXIu
Cj4+Cj4+IEkgd291bGQgYmUgbW9yZSB0aGFuIGhhcHB5IHRvIGNvbnRpbnVlIHRoZSBjb252ZXJz
YXRpb24gYW5kIGZvY3VzIG9uIGFueQo+PiBvdGhlciBxdWVzdGlvbnMgeW91IG1heSBoYXZlLgo+
Pgo+PiBUaGFua3MsCj4+IE5pa29zCj4gCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=
