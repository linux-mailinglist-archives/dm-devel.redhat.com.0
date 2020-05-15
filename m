Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A10041D5ABE
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 22:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589575159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BTUm15HnlVoDSV4aPU3uM6+yQJjSUjMjqjBIl+Obx84=;
	b=iuFA6rGNZQLvHgbTI+maFPpCJmwNDOhmuCPEpgPNrczxBwP9a3e1/dNl4OpElp7waa0TvN
	fBFTM1tn3b6BvPyUL5LJkWgRqtNrdg6K8gJxF+wAWYnuUdeh0tvrO97OGRLEUoafNMJfgN
	UCN6dqPVPjHinF7ym6XOw/hS8rSliOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ehiM7Y0EPe-ydvw_D0Be8g-1; Fri, 15 May 2020 16:39:17 -0400
X-MC-Unique: ehiM7Y0EPe-ydvw_D0Be8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 158C71054F8B;
	Fri, 15 May 2020 20:39:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD9A10013D9;
	Fri, 15 May 2020 20:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 457DE4E9FB;
	Fri, 15 May 2020 20:39:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FKd7fA007972 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 16:39:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51D1F1C80; Fri, 15 May 2020 20:39:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A20CBE38D3
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:39:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6FE831558
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:39:05 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-326-k9RU6sOnNX2VG4DMBp0ofA-1;
	Fri, 15 May 2020 16:39:03 -0400
X-MC-Unique: k9RU6sOnNX2VG4DMBp0ofA-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 15 May 2020 20:37:52 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 15 May 2020 20:38:10 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 15 May 2020 20:38:10 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1996.namprd18.prod.outlook.com (2603:10b6:4:62::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Fri, 15 May 2020 20:38:09 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2979.033;
	Fri, 15 May 2020 20:38:09 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 5/6] libmultipath: simplify failed wwid code
Thread-Index: AQHWKlyJvZyuqKVpakiW8pNgZwjm5aipnMIA
Date: Fri, 15 May 2020 20:38:09 +0000
Message-ID: <6edf2f5f3a74e16fa63cc108b6edba98d0b269b5.camel@suse.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
	<1589507962-6895-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589507962-6895-6-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d27571e-71c9-4285-9c1a-08d7f90fe155
x-ms-traffictypediagnostic: DM5PR1801MB1996:
x-microsoft-antispam-prvs: <DM5PR1801MB199688D8762EBB0BCA63FAD0FCBD0@DM5PR1801MB1996.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0S3H3y/SgS9e6Ojn4GlyFkd4rBQawE1ehg31B+op/xfiTjVNJ8HLWr8MnbGSl8kv09dF6SvxQnPk/tNYjorWq5Nss9VInPoohX3EtIzxUf4S0kpuiLJNfKbOI5Pk/f+rH+aV8iqI9utsgYr58NBuWYHRT+AZKTlyC/pxxJF7dPq8MTvqE5rjtoGM5QObeWoLsHp0RYz4D6pWFkcqq/PaVbGeGDa4y+ZCA9JWEZuFs862GEubuCiWdFek3ayxJSrzOYzGxtaJ7yiwNALJ8nIGYQKELhzgByC43BrhpvtnAf1E7PvsU0A8W1PopwmvuJCuPen3RECTUK0o+RBrzI09iApPa18Z+mJBS3cpc4Y0HwqxZUcwDetFAjq6tssmn+vkxnB/+fOqDs4swM9KZxIvtUsOUC1+WBpY6S/59iJBgoaeRxSyAa9OWcUYCjVD5Psf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(110136005)(66556008)(5660300002)(6512007)(8936002)(66446008)(316002)(26005)(478600001)(71200400001)(76116006)(66574014)(86362001)(8676002)(91956017)(36756003)(66476007)(66946007)(64756008)(2906002)(4326008)(186003)(6506007)(2616005)(6486002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: IipirylfE+VutlhJUNAWvBj826+islIvabWHL34OlSbq+dUHJEx+/vdq8Q8sBUDCFd+Jo9LbVjrH9TfjneZh8fGEDM38jbOweboHIjCWahn2jD65J/Xn3BhOMoyvNzhn9OM3j++0iNeldauNQePsslvRMqAy++UEhcCMuha1/sN5v/4NnrzJaehF50Dq02LoRvuvsMhn2ol7uRG5hC4HEQjBtNdNXtZZkUQbL0QVriPd8rt7lbFse4mf5yyBBIk06rxPrGQAZXWT916A0P754HxhBdiSjUKdJpsFqlDpP1nL/vKuUPF2AGibX72DXkAgUVK2hLXo0hGHyhuuX4CLCy3d0u6gF0P4jmLAc+GMUfxWmdE6GRi/wmJIasl9oOGoY5qUuMVLgau4u1HiUJwPeXsrmK1YKbJjpG8lt3G6sg8lk0FK8AoRKQ6XpYZPR2KRs+Q/WE6I59N38FNS6FYdtJy+iGsmu1hIGs1/C5Ao6KJUxgpE6odlLp1wlgorf5MN
x-ms-exchange-transport-forked: True
Content-ID: <DD79533A5BEA9741AB84220BDD7F9DC8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d27571e-71c9-4285-9c1a-08d7f90fe155
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 20:38:09.5684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCYnokzVRaS9XLu/cDshxbs1gxvQybSR0927sDIhJL/q09Hu4XBElaZVhzyfgeZVRcGZyogXRD2hmWQO1fmd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1996
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04FKd7fA007972
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/6] libmultipath: simplify failed wwid code
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 20:59 -0500, Benjamin Marzinski wrote:
> The (is|mark|unmark)_failed_wwid code is needlessly complicated.
> Locking a file is necssary if multiple processes could otherwise be
> writing to it at the same time. That is not the case with the
> failed_wwids files. They can simply be empty files in a
> directory.  Even
> with all the locking in place, two processes accessing or modifying a
> file at the same time will still race. And even without the locking,
> if
> two processes try to access or modify a file at the same time, they
> will
> both see a reasonable result, and will leave the files in a valid
> state
> afterwards.
>=20
> Instead of doing all the locking work (which made it necessary to
> write
> a file, even just to check if a file existed), simply check for files
> with lstat(), create them with open(), and remove them with unlink().
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

With the follow-up (6/6):
Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

