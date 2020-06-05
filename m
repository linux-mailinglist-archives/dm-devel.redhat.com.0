Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2609B1F03D2
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=netxXJR+yp8CPvrvJkm5dzVIExggGHAkJFIYbrp3c58=;
	b=F+aAd3M1m1ss1lpWPpzUkejce8Hmrxx92e4eRKu3tiA1YEUJATaH/DwdLxAFiRdUjAewSP
	oAOMz7shJUilJAVstQeaO+HL7wk5tgto0SwBsDL5n32w1OVX/0tGO1p0vf7bov1sr8rMd+
	1dEN85f/NxIgTmbwewOW18k37hh8Ssk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-0xGCDvliPO2m-l1ubT1qZQ-1; Fri, 05 Jun 2020 20:22:44 -0400
X-MC-Unique: 0xGCDvliPO2m-l1ubT1qZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22493835B40;
	Sat,  6 Jun 2020 00:22:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F142919D71;
	Sat,  6 Jun 2020 00:22:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEE2C1805319;
	Sat,  6 Jun 2020 00:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055JKpX5001653 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:20:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B7CE10F26F7; Fri,  5 Jun 2020 19:20:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664F910F2701
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:20:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96EC98E2DEF
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:20:48 +0000 (UTC)
Received: from m4a0073g.houston.softwaregrp.com
	(m4a0073g.houston.softwaregrp.com [15.124.2.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-244-sw1eY2QSOyKkdJNycM72lA-1;
	Fri, 05 Jun 2020 15:20:43 -0400
X-MC-Unique: sw1eY2QSOyKkdJNycM72lA-1
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0073g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  5 Jun 2020 19:18:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 5 Jun 2020 19:20:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 5 Jun 2020 19:20:29 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB2011.namprd18.prod.outlook.com (2603:10b6:4:62::34)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22;
	Fri, 5 Jun 2020 19:20:26 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3066.018;
	Fri, 5 Jun 2020 19:20:26 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC PATCH 0/2] multipath: change default devnode blacklist
Thread-Index: AQHWOtChNijDmeLieUmNdoPjJbkaBajKZxcA
Date: Fri, 5 Jun 2020 19:20:26 +0000
Message-ID: <9db7560136de15dad358e2832f236ae131e145ef.camel@suse.com>
References: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d30d6429-4d89-426b-ffcc-08d8098580b5
x-ms-traffictypediagnostic: DM5PR1801MB2011:
x-microsoft-antispam-prvs: <DM5PR1801MB20111C82FD802CF9FBEA9DE8FC860@DM5PR1801MB2011.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xx0hclHkH11IhzGpi6lovdUdtK70WI6A/6WSaB5nhrg4K/etkO67agfT0aFwQqUETjXfpWXwZ+5c/ybOA05du+baA71gTCIZeuZd3Ct9C8z0XMGiMnDtcmEAwqU2TE7MJ+TzmBmL63+pdVKnr7putAvD9lrFlOqrbFN0ZarFs6qifWTXJTgTZ7XbcwViNqdvsLoUmugGApE5eT8g+FqyKZ/9salUpSdVq4SMOpD3zescTgfQNO/c/TikH8ahljyClCdhdpb48p8Zg6Y5Kv90Qc5fNjL5ZqfUUc+n4c61tYvT35oa44TGEUjdVw+W0nEs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(186003)(26005)(86362001)(6506007)(36756003)(8936002)(66946007)(6486002)(64756008)(2906002)(66446008)(76116006)(5660300002)(91956017)(66476007)(478600001)(316002)(66556008)(54906003)(66574014)(2616005)(83380400001)(71200400001)(4326008)(6512007)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: sKVKYu99uFNtSqy3zGhqjKfTdbYgiU79OsiBROw4Pw99kEkh5RXCNij9/rCPRAL45MwCII6x0HoTphRu0CIuR5tQtbisn9p44o6gYU88iBuO97H4MZgwH8nbxLXt/0Y5qePLiu0cyKxoMMXo/UTBNnM/TYU/e4CuGLbG30JrAkIjDOgN+FMHoIbf/5up4oYesuVo6nlWbfbhSrzdlCWqcKiR0CohlEjB037JjuQoCT9bBo54wMpsfoKqfuVJIysWlxnzcC/8VJhrD3MXyh3vEU+IjEX+L4CdUnxJPRYAUBpLroWC49gybT8gAyqha3NPbFX59qlzIjYExYGa7Iczq2hfSkHdzTMAfKOPtf/KJGjOHKjhNcRwWcYcvJZSJs9AU4bQh+KeovzHCBYsr23H5xTsuWPNWdub5VsLZyJaoEMAhtliNXxL+NW3iionK0LvGS8N1FjZie6I7R478LqN7l2qNachEDdDhRZvrqDOkMo=
x-ms-exchange-transport-forked: True
Content-ID: <22578AD5240ED44795EBC3D6AB806D47@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d30d6429-4d89-426b-ffcc-08d8098580b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 19:20:26.5637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bi5nV/0xE9/qdPk1LrOvwbJGtHXlF3rT9EQZjZ5LicGSQKhVGf5SxMTECmL2oT4LZEg3kWNnJWRULtSvASjgkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2011
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 055JKpX5001653
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"nkshirsa@redhat.com" <nkshirsa@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] multipath: change default devnode
	blacklist
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Thu, 2020-06-04 at 19:30 -0500, Benjamin Marzinski wrote:
> I recently got a request to add the Oracle ASM filer driver devices
> to
> multipath's builtin devnode blacklist.  However, instead of having to
> do
> always this for each device type individually, I decided to make
> multipath blacklist all non scsi, nvme, and dasd devnodes by default.
> This is what the multipath udev rules already do. If people don't
> like
> this solution, the alternative is to add another line to the default
> devnode blacklist like "^(asm/|oracleafd/|ofsctl)".

Thanks, this looks ok. But I'd like to propose an alternative idea:
Extend the RE syntax in our config file to allow negated regular=20
expressions. Like this:

blacklist {
    devnode "!(^(sd[a-z]|dasd[a-z]|nvme[0-9]))"
}

The "!(${RE})" construct would mean "everything that does not match ${RE}".
This logic would only be applied to an entire regex.
If a user needs a RE matching with "!(" and ending with ")", she can escape=
=20
the exclamation mark "\!(like this)".

AFAICS this could be implemented quite easily (by adding a "bool negate" fi=
eld
in struct blentry and some simple parser logic), and could be applied to ot=
her=20
REs in the config file as well. We could print this with "multipath -t", an=
d=20
we wouldn't need to document an exception.

It's also pretty much backwards-compatible, I don't think many people use
regexes starting with "!(" for multipath these days.

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

