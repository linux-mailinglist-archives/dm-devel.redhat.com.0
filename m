Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924E7984CE
	for <lists+dm-devel@lfdr.de>; Fri,  8 Sep 2023 11:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694165395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=whUTA0Fz6YosBsOQ3/awIyD6QRDZJrEj9dppDAzP85c=;
	b=HemOlmcE9tQzZF7J3GnzWqMs1OikJN+N41JfgP684OY2YRz9EEg/tB3wGFfdM1Jjcaui4/
	YAFuHXdy75zPToZE8U7X0zi68/+mhHqrod3r1BQaojFIw2GN1spicHPBjTnqedOMs957UT
	tT0+FjIbDs2864sNDBoDUx5gRrVMdwY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-CEnarK9eMiy9VMjh34q8cw-1; Fri, 08 Sep 2023 05:29:53 -0400
X-MC-Unique: CEnarK9eMiy9VMjh34q8cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0620B28088A2;
	Fri,  8 Sep 2023 09:29:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5314963F67;
	Fri,  8 Sep 2023 09:29:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 98C6F19465B3;
	Fri,  8 Sep 2023 09:29:45 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9E2B2194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  8 Sep 2023 09:29:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79E6A2026D2B; Fri,  8 Sep 2023 09:29:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.43.17.103] (unknown [10.43.17.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90AA92026D76;
 Fri,  8 Sep 2023 09:29:42 +0000 (UTC)
Message-ID: <86235d7a-a7ea-49da-968e-c5810cbf4a7b@redhat.com>
Date: Fri, 8 Sep 2023 11:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Kara <jack@suse.cz>, Mikulas Patocka <mpatocka@redhat.com>
References: <59b54cc3-b98b-aff9-14fc-dc25c61111c6@redhat.com>
 <20230906-launenhaft-kinder-118ea59706c8@brauner>
 <f5d63867-5b3e-294b-d1f5-a128817cfc7@redhat.com>
 <20230906-aufheben-hagel-9925501b7822@brauner>
 <60f244be-803b-fa70-665e-b5cba15212e@redhat.com>
 <20230906-aufkam-bareinlage-6e7d06d58e90@brauner>
 <818a3cc0-c17b-22c0-4413-252dfb579cca@redhat.com>
 <20230907094457.vcvmixi23dk3pzqe@quack3>
 <20230907-abgrenzen-achtung-b17e9a1ad136@brauner>
 <513f337e-d254-2454-6197-82df564ed5fc@redhat.com>
 <20230908073244.wyriwwxahd3im2rw@quack3>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <20230908073244.wyriwwxahd3im2rw@quack3>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH] fix writing to the filesystem after unmount
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDA4LiAwOS4gMjMgdiA5OjMyIEphbiBLYXJhIG5hcHNhbChhKToKPiBPbiBUaHUgMDctMDkt
MjMgMTQ6MDQ6NTEsIE1pa3VsYXMgUGF0b2NrYSB3cm90ZToKPj4KPj4gT24gVGh1LCA3IFNlcCAy
MDIzLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToKPj4KPj4+PiBJIHRoaW5rIHdlJ3ZlIGdvdCB0
b28gZGVlcCBkb3duIGludG8gImhvdyB0byBmaXggdGhpbmdzIiBidXQgSSdtIG5vdCAxMDAlCj4+
PiBXZSBkaWQuCj4+Pgo+Pj4+IHN1cmUgd2hhdCB0aGUgImJ1ZyIgYWN0dWFsbHkgaXMuIEluIHRo
ZSBpbml0aWFsIHBvc3RpbmcgTWlrdWxhcyB3cml0ZXMgInRoZQo+Pj4+IGtlcm5lbCB3cml0ZXMg
dG8gdGhlIGZpbGVzeXN0ZW0gYWZ0ZXIgdW5tb3VudCBzdWNjZXNzZnVsbHkgcmV0dXJuZWQiIC0g
aXMKPj4+PiB0aGF0IHJlYWxseSBzdWNoIGEgYmlnIGlzc3VlPwo+PiBJIHRoaW5rIGl0J3MgYW4g
aXNzdWUgaWYgdGhlIGFkbWluaXN0cmF0b3Igd3JpdGVzIGEgc2NyaXB0IHRoYXQgdW5tb3VudHMg
YQo+PiBmaWxlc3lzdGVtIGFuZCB0aGVuIGNvcGllcyB0aGUgdW5kZXJ5bGluZyBibG9jayBkZXZp
Y2Ugc29tZXdoZXJlLiBPciBhCj4+IHNjcmlwdCB0aGF0IHVubW91bnRzIGEgZmlsZXN5c3RlbSBh
bmQgcnVucyBmc2NrIGFmdGVyd2FyZHMuIE9yIGEgc2NyaXB0Cj4+IHRoYXQgdW5tb3VudHMgYSBm
aWxlc3lzdGVtIGFuZCBydW5zIG1rZnMgb24gdGhlIHNhbWUgYmxvY2sgZGV2aWNlLgo+IFdlbGws
IGUuZy4gZTJmc3Byb2dzIHVzZSBPX0VYQ0wgb3BlbiBzbyB0aGV5IHdpbGwgZGV0ZWN0IHRoYXQg
dGhlIGZpbGVzeXN0ZW0KPiBoYXNuJ3QgYmVlbiB1bm1vdW50ZWQgcHJvcGVybHkgYW5kIGNvbXBs
YWluLiBXaGljaCBpcyBleGFjdGx5IHdoYXQgc2hvdWxkCj4gSU1ITyBoYXBwZW4uCj4KPj4+PiBB
bnlib2R5IGVsc2UgY2FuIG9wZW4gdGhlIGRldmljZSBhbmQgd3JpdGUgdG8gaXQgYXMgd2VsbC4g
T3IgZXZlbgo+Pj4+IG1vdW50IHRoZSBkZXZpY2UgYWdhaW4uIFNvIHVzZXJzcGFjZSB0aGF0IHJl
bGllcyBvbiB0aGlzIGlzIGtpbmQgb2YKPj4+PiBmbGFreSBhbnl3YXkgKGFuZCBhbHdheXMgaGFz
IGJlZW4pLgo+PiBJdCdzIGFkbWluJ3MgcmVzcG9uc2liaWxpdHkgdG8gbWFrZSBzdXJlIHRoYXQg
dGhlIGZpbGVzeXN0ZW0gaXMgbm90Cj4+IG1vdW50ZWQgbXVsdGlwbGUgdGltZXMgd2hlbiBoZSB0
b3VjaGVzIHRoZSB1bmRlcmx5aW5nIGJsb2NrIGRldmljZSBhZnRlcgo+PiB1bm1vdW50Lgo+IFdo
YXQgSSB3YW50ZWQgdG8gc3VnZ2VzdCBpcyB0aGF0IHdlIHNob3VsZCBwcm92aWRlIG1lYW5zIGhv
dyB0byBtYWtlIHN1cmUKPiBibG9jayBkZXZpY2UgaXMgbm90IGJlaW5nIG1vZGlmaWVkIGFuZCBl
ZHVjYXRlIGFkbWlucyBhbmQgdG9vbCBhdXRob3JzCj4gYWJvdXQgdGhlbS4gQmVjYXVzZSBqdXN0
IGRvaW5nICJ1bW91bnQgL2Rldi9zZGExIiBhbmQgdGhpbmtpbmcgdGhpcyBtZWFucwo+IHRoYXQg
L2Rldi9zZGExIGlzIHVudXNlZCBub3cgc2ltcGx5IGlzIG5vdCBlbm91Z2ggaW4gdG9kYXkncyB3
b3JsZCBmb3IKPiBtdWx0aXBsZSByZWFzb25zIGFuZCB3ZSBjYW5ub3Qgc29sdmUgaXQganVzdCBp
biB0aGUga2VybmVsLgo+CgpIaQoKCi9tZSBqdXN0IHdvbmRlcmluZyBob3cgZG8geW91IHRoZW4g
aW1hZ2luZSBpLmUuIHNhZmUgcmVtb3ZhbCBvZiBVU0IgZHJpdmUgd2hlbiAKdXNlciBzaGFsbCBu
b3QgZXhwZWN0IHVubW91bnQgcmVhbGx5IHVubW91bnRzIGZpbGVzeXN0ZW0/CgpJTUhPwqAgLSB1
bm1vdW50IHNob3VsZCBkZXRlY3Qgc29tZSB2ZXJ5IHN1c3BpY2lvdXMgc3RhdGUgb2YgYmxvY2sg
ZGV2aWNlIGlmIGl0IApjYW5ub3QgY29ycmVjdGx5IHByb2NlZWQgLSBpLmUuIHJlcG9ydGluZyAn
d2FybmluZy9lcnJvcicgb24gc3VjaCBjb21tYW5kcy4uLgoKTWFpbiBwcm9ibGVtIGlzIC0gaWYg
dGhlICd1bm1vdW50JyBpcyBzdWNjZXNzZnVsIGluIHRoaXMgY2FzZSAtIHRoZSBsYXN0IApjb25u
ZWN0aW9uIHVzZXJzcGFjZSBoYWQgdG8gdGhpcyBmaWxleXN0ZW0gaXMgbG9zdCAtIGFuZCB1c2Vy
IGNhbm5vdCBnZXQgcmlkIApvZiBzdWNoIGZpbGVzeXN0ZW0gYW55bW9yZSBmb3IgYSBzeXN0ZW0u
CgpJJ2QgbGlrZWx5IHByb3Bvc2UgaW4gdGhpcyBwYXJ0aWN1bGFyIHN0YXRlIG9mIHVubW91bnRp
bmcgb2YgYSBmcm96ZW4gCmZpbGVzeXN0ZW0gdG8ganVzdCBwcm9jZWVkIC0gYW5kIGRyb3AgdGhl
IGZyb3plbiBzdGF0ZSB0b2dldGhlciB3aXRoIHJlbGVhc2UgCmZpbGVzeXN0ZW0gYW5kIG5ldmVy
IGlzc3VlIGFueSBpb2N0bCBmcm9tIHN1Y2ggZmlsZWxzeXN0ZW0gdG8gdGhlIGRldmljZSBiZWxv
dyAKLSBzbyBpdCB3b3VsZCBub3QgYmUgYSAxMDAlIHZhbGlkIHVubW91bnQgLSBidXQgc2luY2Ug
dGhlIGZyZWV6ZSBzaG91bGQgYmUgCm5lYXJseSBlcXVpdmFsZW50IG9mIGhhdmluZyBhIHByb3Bl
ciAndW5tb3VudCcgYmVpbmcgZG9uZSAtwqAgaXQgc2hvdWRuJ3QgYmUgCmNhdXNpbmcgYW55IGhh
cm0gZWl0aGVyIC0gYW5kwqAgYWxsIHJlc291cmNlcyBhc3NvY2lhdGVkIGNvdWxkwqAgYmUgCidy
ZWxlYXNlZC7CoMKgwqAgSU1ITyBpdCdzIGNvcnJlY3QgdG8gJ2Ryb3AnIGZyb3plbiBzdGF0ZSBm
b3IgZmlsZXN5c3RlbSB0aGF0IGlzIApub3QgZ29pbmcgdG8gZXhpc3QgYW55bW9yZcKgIChhc3N1
bWluZyBpdCdzIHRoZSBsYXN0wqAgc3VjaCB1c2VyKQoKUmVnYXJkcwoKClpkZW5lawoKCi0tCmRt
LWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

