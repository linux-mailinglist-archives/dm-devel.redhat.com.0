Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3C241A2
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 22:02:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 950FA7FDFA;
	Mon, 20 May 2019 20:01:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48A81100200A;
	Mon, 20 May 2019 20:00:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 282D41806B19;
	Mon, 20 May 2019 20:00:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KJx9C1022747 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 15:59:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C94710027C2; Mon, 20 May 2019 19:59:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67C5310027BF
	for <dm-devel@redhat.com>; Mon, 20 May 2019 19:59:07 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 123C030833AF
	for <dm-devel@redhat.com>; Mon, 20 May 2019 19:58:29 +0000 (UTC)
Received: from lass-mb.fritz.box (aftr-95-222-30-100.unity-media.net
	[95.222.30.100])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id AC485209BD;
	Mon, 20 May 2019 21:58:21 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <ea5552b8-7b6a-2516-d968-c3f3c731e159@gmail.com>
Date: Mon, 20 May 2019 21:58:20 +0200
Message-Id: <A140375B-7C55-4D1D-8892-3C93E5F0E49F@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<CAK-xaQYPs62v971zm1McXw_FGzDmh_vpz3KLEbxzkmrsSgTfXw@mail.gmail.com>
	<9D4ECE0B-C9DD-4BAD-A764-9DE2FF2A10C7@bi-co.net>
	<CAK-xaQYakXcAbhfiH_VbqWkh+HBJD5N69ktnnA7OnWdhL6fDLA@mail.gmail.com>
	<ea5552b8-7b6a-2516-d968-c3f3c731e159@gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 19:58:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 19:58:50 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 134.119.3.22 voltaic.bi-co.net 134.119.3.22
	voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4KJx9C1022747
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Andrea Gelmini <andrea.gelmini@gelma.net>,
	Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 20 May 2019 20:02:17 +0000 (UTC)

Cj4gQW0gMjAuMDUuMjAxOSB1bSAxODo0NSBzY2hyaWViIE1pbGFuIEJyb3ogPGdtYXp5bGFuZEBn
bWFpbC5jb20+Ogo+IAo+IE9uIDIwLzA1LzIwMTkgMTY6NTMsIEFuZHJlYSBHZWxtaW5pIHdyb3Rl
Ogo+IC4uLgo+PiBBbHNvLCBjaGFuZ2luZyBjcnlwdHRhYjoKPj4gcm9vdEBnbGV0On4jIGNhdCAv
ZXRjL2NyeXB0dGFiCj4+IHNkYTZfY3J5cHQgVVVJRD1mZTAzZTJlNi1iOGIxLTQ2NzItOGEzZS1i
NTM2YWM0ZTE1Mzkgbm9uZSBsdWtzLGRpc2NhcmQKPj4gCj4+IHJlbW92aW5nIGRpc2NhcmQgZGlk
bid0IHNvbHZlIHRoZSBpc3N1ZS4KPiAKPiBUaGlzIGlzIHZlcnkgc3RyYW5nZSwgZGlzYWJsaW5n
IGRpc2NhcmQgc2hvdWxkIHJlamVjdCBldmVyeSBkaXNjYXJkIElPCj4gb24gdGhlIGRtY3J5cHQg
bGF5ZXIuIEFyZSB5b3Ugc3VyZSBpdCB3YXMgcmVhbGx5IGRpc2FibGVkPwo+IAo+IE5vdGUsIGl0
IGlzIHRoZSByb290IGZpbGVzeXN0ZW0sIHNvIHlvdSBoYXZlIHRvIHJlZ2VuZXJhdGUgaW5pdHJh
bWZzCj4gdG8gdXBkYXRlIGNyeXB0dGFiIGluc2lkZSBpdC4KCkZvciBtZSwgSSBjYW5ub3QgcmVw
cm9kdWNlIHRoZSBpc3N1ZSB3aGVuIEkgcmVtb3ZlIHRoZSBkaXNjYXJkIG9wdGlvbiBmcm9tIHRo
ZSBjcnlwdHRhYiAoYW5kIHJlZ2VuZXJhdGUgdGhlIGluaXRyYW1mcykuIFdoZW4gdHJ5aW5nIGZz
dHJpbSBJIGp1c3QgZ2V0IOKAnHRoZSBkaXNjYXJkIG9wZXJhdGlvbiBpcyBub3Qgc3VwcG9ydGVk
4oCdLCBhcyBJIHdvdWxkIGV4cGVjdC4gTm8gZGFtYWdlIGlzIGRvbmUgdG8gb3RoZXIgbG9naWNh
bCB2b2x1bWVzLgoKSG93ZXZlciwgbXkgc3RhY2sgZGlmZmVycyBmcm9tIEFuZHJlYeKAmXMgaW4g
dGhhdCBJIGhhdmUgZG0tY3J5cHQgb24gYW4gTFZNIGxvZ2ljYWwgdm9sdW1lIGFuZCBub3QgZG0t
Y3J5cHQgYXMgYSBwaHlzaWNhbCB2b2x1bWUgZm9yIExWTS4gTm90IHN1cmUgaWYgdGhhdCBtYWtl
cyBhIGRpZmZlcmVuY2UgaGVyZS4KCkNoZWVycywKTWljaGFlbAoKPiBDb3VsZCB5b3UgcGFzdGUg
ImRtc2V0dXAgdGFibGUiIGFuZCAibHNibGsgLUQiIHRvIHZlcmlmeSB0aGF0IGRpc2NhcmQgZmxh
Zwo+IGlzIG5vdCB0aGVyZT8KPiAoSSBtZWFuIGRtc2V0dXAgdGFibGUgd2l0aCB0aGUgemVyb2Vk
IGtleSwgYXMgYSBkZWZhdWx0IGFuZCBzYWZlIG91dHB1dC4pCj4gCj4gTWlsYW4KCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
