Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D37C02001F1
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 08:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592548398;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aWdCPeCPIRkrYYhK7LWcVW8FL4+bruzuJXL79saw8fA=;
	b=J6XKAuxNxeUULYxTWsFPXX3MYi03x+nNt2g2Xu0QgY5eFpCIpL3xaEsyEqCMQsjsf0nVxt
	4WLEdwICNOMN9fkSvRTjTljo7wSYmO+ukcIy5ZQ/KlTh3zDsA7WvmP+yprLZirrDftiBSh
	nhzU3c4Tv+ELshA21O4ohpJiQO4y61s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-RS19oBfbN5yZM7sEiJTS7g-1; Fri, 19 Jun 2020 02:33:16 -0400
X-MC-Unique: RS19oBfbN5yZM7sEiJTS7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F811902EA9;
	Fri, 19 Jun 2020 06:33:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B76AE7CACB;
	Fri, 19 Jun 2020 06:33:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D40E4833C1;
	Fri, 19 Jun 2020 06:32:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J6Wgps011290 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 02:32:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B903B103285; Fri, 19 Jun 2020 06:32:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E26103284
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 06:32:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B68D101A526
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 06:32:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-262-enUsVq6JOTOZMRj3K3zG_A-1;
	Fri, 19 Jun 2020 02:32:37 -0400
X-MC-Unique: enUsVq6JOTOZMRj3K3zG_A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 369DDAC22;
	Fri, 19 Jun 2020 06:32:35 +0000 (UTC)
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a1df6c71-1427-9649-3e81-138ffcd04370@suse.de>
Date: Fri, 19 Jun 2020 08:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618231711.GM5894@octiron.msp.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J6Wgps011290
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8xOS8yMCAxOjE3IEFNLCBCZW5qYW1pbiBNYXJ6aW5za2kgd3JvdGU6Cj4gT24gVGh1LCBK
dW4gMTgsIDIwMjAgYXQgMDc6MzQ6MzhQTSArMDAwMCwgTWFydGluIFdpbGNrIHdyb3RlOgo+PiBP
biBXZWQsIDIwMjAtMDYtMTcgYXQgMTk6MjQgLTA1MDAsIEJlbmphbWluIE1hcnppbnNraSB3cm90
ZToKPj4+IElmIGEgbXVsdGlwYXRoIGRldmljZSBpcyByZW1vdmVkIGR1cmluZywgb3IgaW1tZWRp
YXRlbHkgYmVmb3JlIHRoZQo+Pj4gY2FsbAo+Pj4gdG8gY2hlY2tfcGF0aCgpLCBtdWx0aXBhdGhk
IGNhbiBiZWhhdmUgaW5jb3JyZWN0bHkuIEEgbWlzc2luZwo+Pj4gbXVsdHBhdGgKPj4+IGRldmlj
ZSB3aWxsIGNhdXNlIHVwZGF0ZV9tdWx0aXBhdGhfc3RyaW5ncygpIHRvIGZhaWwsIHNldHRpbmcK
Pj4+IHBwLT5kbXN0YXRlIHRvIFBTVEFURV9VTkRFRi4gIElmIHRoZSBwYXRoIGlzIHVwLCB0aGlz
IHN0YXRlIHdpbGwKPj4+IGNhdXNlCj4+PiByZWluc3RhdGVfcGF0aCgpIHRvIGJlIGNhbGxlZCwg
d2hpY2ggd2lsbCBhbHNvIGZhaWwuICBUaGlzIHdpbGwKPj4+IHRyaWdnZXIKPj4+IGEgcmVsb2Fk
LCByZXN0b3JpbmcgdGhlIHJlY2VudGx5IHJlbW92ZWQgZGV2aWNlLgo+Pj4KPj4+IElmIHVwZGF0
ZV9tdWx0aXBhdGhfc3RyaW5ncygpIGZhaWxzIGJlY2F1c2UgdGhlcmUgaXMgbm8gbXVsdGlwYXRo
Cj4+PiBkZXZpY2UsIGNoZWNrX3BhdGggc2hvdWxkIGp1c3QgcXVpdCwgc2luY2UgdGhlIHJlbW92
ZSBkbWV2ZW50IGFuZAo+Pj4gdWV2ZW50Cj4+PiBhcmUgbGlrZWx5IGFscmVhZHkgcXVldWVkIHVw
LiBBbHNvLCBJIGRvbid0IHNlZSBhbnkgcmVhc29uIHRvIHJlbG9hZAo+Pj4gdGhlCj4+PiBtdWx0
aXBhdGggZGV2aWNlIGlmIHJlaW5zdGF0ZSBmYWlscy4gVGhpcyBjb2RlIHdhcyBhZGRlZCBieQo+
Pj4gZmFjNjhkN2E5OWVmMTdkNDk2MDc5NTM4YTVjNjgzNmFjZDc5MTFhYiwgd2hpY2ggY2xhbWlu
ZWQgdGhhdAo+Pj4gcmVpbnN0YXRlCj4+PiBjb3VsZCBmYWlsIGlmIHRoZSBwYXRoIHdhcyBkaXNh
YmxlZC4gIExvb2tpbmcgdGhyb3VnaCB0aGUgY3VycmVudAo+Pj4ga2VybmVsCj4+PiBjb2RlLCBJ
IGNhbid0IHNlZSBhbnkgcmVhc29uIHdoeSBhIHJlaW5zdGF0ZSB3b3VsZCBmYWlsLCB3aGVyZSBh
Cj4+PiByZWxvYWQKPj4+IHdvdWxkIGhlbHAuIElmIHRoZSBwYXRoIHdhcyBtaXNzaW5nIGZyb20g
dGhlIG11bHRpcGF0aCBkZXZpY2UsCj4+PiB1cGRhdGVfbXVsdGlwYXRoX3N0cmluZ3MoKSB3b3Vs
ZCBhbHJlYWR5IGNhdGNoIHRoYXQsIGFuZCBxdWl0Cj4+PiBjaGVja19wYXRoKCkgZWFybHksIHdo
aWNoIG1ha2UgbW9yZSBzZW5zZSB0byBtZSB0aGFuIHJlbG9hZGluZyBkb2VzLgo+Pgo+PiBmYWM2
OGQ3IGlzIHJlbGF0ZWQgdG8gdGhlIGZhbW91cyAiZG0tbXVsdGlwYXRoOiBBY2NlcHQgZmFpbGVk
IHBhdGhzIGZvcgo+PiBtdWx0aXBhdGggbWFwcyIgcGF0Y2ggKGUuZy4KPj4gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8zMzY4MzgxLyM3MTkzMDAxKSwgd2hpY2ggbmV2ZXIgbWFk
ZQo+PiBpdCB1cHN0cmVhbS4gU1VTRSBrZXJuZWxzIGhhdmUgc2hpcHBlZCB0aGlzIHBhdGNoIGZv
ciBhIGxvbmcgdGltZSwgYnV0Cj4+IHdlIGRvbid0IGFwcGx5IGl0IGFueSBtb3JlIGluIHJlY2Vu
dCBrZXJuZWxzLgo+Pgo+PiBXaXRoIHRoaXMgcGF0Y2gsIFRoZSByZWluc3RhdGVfcGF0aCgpIGZh
aWx1cmUgd291bGQgb2NjdXIgaWYgbXVsdGlwYXRoZAo+PiBoYWQgY3JlYXRlZCBhIHRhYmxlIHdp
dGggYSAiZGlzYWJsZWQiIGRldmljZSAob25lIHdoaWNoIHdvdWxkIGJlCj4+IHByZXNlbnQgaW4g
YSBkbSBtYXAgZXZlbiB0aG91Z2ggdGhlIGFjdHVhbCBibG9jayBkZXZpY2UgZGlkbid0IGV4aXN0
KSwKPj4gYW5kIHRoZW4gdHJpZWQgdG8gcmVpbnN0YXRlIHN1Y2ggYSBwYXRoLiBJdCBzb3VuZHMg
dW5saWtlbHksIGJ1dCBpdAo+PiBtaWdodCBiZSBwb3NzaWJsZSBpZiBkZXZpY2VzIGFyZSBjb21p
bmcgYW5kIGdvaW5nIGluIHF1aWNrIHN1Y2Nlc3Npb24uCj4+IEluIHRoYXQgc2l0dWF0aW9uLCBh
bmQgd2l0aCB0aGUgImFjY2VwdCBmYWlsZWQgcGF0aCIgcGF0Y2ggYXBwbGllZCwgYQo+PiByZWxv
YWQgbWFrZXMgc29tZSBzZW5zZSwgYmVjYXVzZSByZWxvYWQgKHVubGlrZSByZWluc3RhdGUpIHdv
dWxkIG5vdAo+PiBmYWlsIChhdCBsZWFzdCBub3QgZm9yIHRoaXMgcmVhc29uKSBhbmQgd291bGQg
YWN0dWFsbHkgYWRkIHRoYXQganVzdC0KPj4gcmVpbnN0YXRlZCBwYXRoLiBPVE9ILCBpdCdzIG5v
dCBsaWtlbHkgdGhhdCB0aGUgcmVsb2FkIHdvdWxkIGltcHJvdmUKPj4gbWF0dGVycywgZWl0aGVy
LiBBZnRlciBhbGwsIG11bHRpcGF0aGQgaXMganVzdCB0cnlpbmcgdG8gcmVpbnN0YXRlIGEKPj4g
bm9uLWV4aXN0aW5nIHBhdGguIFNvLCBJJ20gZmluZSB3aXRoIHNraXBwaW5nIHRoZSByZWxvYWQu
Cj4+Ckl0J3MgYWN0dWFsbHkgX25vdF8gdW5saWtlbHksIGJ1dCBhIGRpcmVjdCByZXN1bHQgb2Yg
bXVsdGlwYXRoZCAKbGlzdGVuaW5nIHRvIHVldmVudHMuCgpJZiB5b3UgaGF2ZSBhIG1hcCB3aXRo
IGZvdXIgcGF0aHMsIGFuZCBhbGwgZm91ciBvZiB0aGVtIGFyZSBnb2luZyBkb3duLCAKeW91IGVu
ZCB1cCBnZXR0aW5nIGZvdXIgZXZlbnRzLgpBbmQgbXVsdGlwYXRoIHdpbGwgYmUgcHJvY2Vzc2lu
ZyBlYWNoIGV2ZW50IF9pbmRpdmlkdWFsbHlfLCBjYXVzaW5nIGl0IAp0byBnZW5lcmF0ZSBhIHJl
bG9hZCBzZXF1ZW5jZSBsaWtlOgoKW2EgYiBjIGRdCltiIGMgZF0KW2MgZF0KW2RdCltdCgpPZiB3
aGljaCBvbmx5IHRoZSBsYXN0IGlzIHZhbGlkLCBhcyBhbGwgdGhlIGludGVybWVkaWF0ZSBvbmVz
IGNvbnRhaW4gCmludmFsaWQgcGF0aHMuCgpBbmQgX3RoYXRfIGlzIHRoZSBzY2VuYXJpbyBJIHdh
cyByZWZlcnJpbmcgdG8gd2hlbiBjcmVhdGluZyB0aGUgcGF0Y2guCgpDaGVlcnMsCgpIYW5uZXMK
LS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0
d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkx
MSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhy
ZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==

